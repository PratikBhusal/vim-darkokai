function! s:split_highlights(group_name, begin, end) abort
    " execute() needs has('patch-7-4-2008') to be true.
    return map(
    \   split(
    \       substitute(
    \           has('patch-7-4-2008')
    \               ? execute('highlight ' . a:group_name)
    \               : darkokai#compatibility#execute#call('highlight ' . a:group_name),
    \           '\n\s\+',
    \           ' ',
    \           'g'
    \       ),
    \       '\n'
    \   ),
    \   "split(v:val, '\\s\\+xxx\\s\\+')[" . a:begin . ':' . a:end . ']'
    \ )
endfunction

function! s:get_highlight_names() abort
    return map(s:split_highlights('', 0, 0), 'v:val[0]')
endfunction

function! s:map_highlight_group(key, val)
    if a:val[0] ==# 'cleared'
        return {a:key : {}}
    endif

    let l:colors = {}

    " If the highlight group has any links to it, preprocess it
    if len(a:val) == 2 && a:val[1][:3] ==# ' to '
        let colors['links'] = split(a:val[1])[-1]
    endif

    " If group is not strictly a link, preprocess highlight info
    if a:val[0] !=# 'links'
        if has('lambda')
            let l:F_extract_colors = {colors -> map(
            \   map(
            \       colors,
            \       "split(v:val, '=')"
            \   ),
            \   '{v:val[0]: v:val[1]}'
            \  )}
        else
            let l:F_extract_colors = function('darkokai#compatibility#lambda#highlight_map_split')
        endif

        call map(
            \ l:F_extract_colors(
                \ split( split(split(a:val[0], '\slinks')[0], 'font')[0] )
            \ ),
            \ 'extend(l:colors, v:val)'
        \ )
    endif

    return {a:key : l:colors}
endfunction

function! s:get_highlights_names_values(group_name) abort
    let l:highlights_dict = {}
    for [l:name, l:settings] in s:split_highlights(a:group_name, 0, 1)
        call extend(
        \   l:highlights_dict,
        \   s:map_highlight_group(
        \       l:name,
        \       split(l:settings, "links\\zs")
        \   )
        \ )
    endfor

    return l:highlights_dict
endfunction

function! darkokai#utils#extract#refresh_highlights()
    if exists('g:darkokai#highlights#defined')
        let l:highlight_names = {}
        for l:name in s:get_highlight_names()
            let l:highlight_names[l:name] = 0
        endfor

        let g:darkokai#highlights#undefined = keys(filter(
            \ l:highlight_names,
            \ '!has_key(g:darkokai#highlights#defined, v:key)'
        \ ))
    endif
endfunction

function! darkokai#utils#extract#all_highlights()
    return s:get_highlights_names_values('')
endfunction

function! darkokai#utils#extract#highlight(group_name)
    return s:get_highlights_names_values(a:group_name)[a:group_name]
endfunction
