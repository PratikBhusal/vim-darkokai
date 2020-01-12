function! s:map_highlight_group(key, val)
    if a:val[1][0] ==# 'cleared'
        return {a:val[0] : {}}
    endif

    let l:colors = {}

    " If the highlight group has any links to it, preprocess it
    if len(a:val[1]) == 2 && a:val[1][1][:3] ==# ' to '
        let colors['links'] = split(a:val[1][1])[-1]
    endif

    " If group is not strictly a link, preprocess highlight info
    if a:val[1][0] !=# 'links'
        let l:F_extract_colors = {colors -> map(
            \ map(
                \ colors,
                \ "split(v:val, '=')"
            \ ),
            \ '{v:val[0]: v:val[1]}'
        \ )}

        call map(
            \ l:F_extract_colors( split( split(a:val[1][0], '\slinks')[0] ) ),
            \ 'extend(l:colors, v:val)'
        \ )
    endif

    return {a:val[0] : l:colors}
endf

function! s:get_highlights() abort
    let l:highlights = substitute(execute('highlight'), '\n\s\+', ' ', 'g')
    let l:highlights = split(l:highlights, '\n')
    call map(l:highlights, "split(v:val, '\\s\\+xxx\\s\\+')")
    call map(l:highlights, '[copy(v:val)[0], split(copy(v:val)[1], "links\\zs")]')
    call map(l:highlights, function('s:map_highlight_group'))

    let l:highlights_dict = {}
    call map(l:highlights, 'extend(l:highlights_dict, v:val)')

    return l:highlights_dict
endfunction

let s:colorscheme_highlights = s:get_highlights()

function! darkokai#utils#highlight#refresh_highlights()
    let s:colorscheme_highlights = s:get_highlights()
endfunction

function! darkokai#utils#highlight#get_all_highlights()
    return s:colorscheme_highlights
endfunction

" function! darkokai#utils#highlight#get_defined_highlights()
"     return filter(copy(s:colorscheme_highlights), '!empty(v:val)')
" endfunction

" function! darkokai#utils#highlight#get_cleared_highlights()
"     return sort(keys(filter(copy(s:colorscheme_highlights), 'empty(v:val)')))
" endfunction
