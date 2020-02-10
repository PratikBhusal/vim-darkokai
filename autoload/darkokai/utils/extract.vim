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

function! s:get_highlights() abort
    " execute() needs has('patch-7-4-2008') to be true.
    let l:highlights = split(
    \   substitute(
    \       has('patch-7-4-2008')
    \           ? execute('highlight')
    \           : darkokai#compatibility#execute#call('highlight'),
    \       '\n\s\+',
    \       ' ',
    \       'g'
    \   ),
    \   '\n'
    \ )

    let l:highlights_dict = {}
    for l:list in map(l:highlights, "split(v:val, '\\s\\+xxx\\s\\+')")
        call extend(
        \   l:highlights_dict,
        \   s:map_highlight_group(
        \       l:list[0],
        \       split(l:list[1], "links\\zs")
        \   )
        \ )
    endfor

    return l:highlights_dict
endfunction

let s:colorscheme_highlights = s:get_highlights()

function! darkokai#utils#extract#refresh_highlights()
    let s:colorscheme_highlights = s:get_highlights()

    if exists('g:darkokai#highlights#defined')
        let g:darkokai#highlights#undefined = keys(filter(
            \ copy(s:colorscheme_highlights),
            \ '!has_key(g:darkokai#highlights#defined, v:key)'
        \ ))
    endif
endfunction

function! darkokai#utils#extract#all_highlights()
    return s:colorscheme_highlights
endfunction
