function! s:get_color_overrides(target)
    if has('lambda')
        return filter(
        \   map(
        \       copy( get(g:, 'darkokai_color_overrides', {}) ),
        \       { _, val -> get(val, a:target, '') }
        \   )
        \   ,"v:val !=# ''"
        \ )
    endif

    return filter(
    \   map(
    \       copy( get(g:, 'darkokai_color_overrides', {}) ),
    \       'darkokai#compatibility#lambda#color_override(v:val, a:target)'
    \   )
    \   ,"v:val !=# ''"
    \ )
endfunction

function! s:extend_colors(dest, source, highlight)
    for [key, val] in items(a:source)
        if !has_key(a:dest, key)
            let a:dest[key] = val
        elseif !has_key(a:dest[key], a:highlight)
            call extend(a:dest[key], val, 'error')
        else
            call extend(a:dest[key], val, 'force')
        endif
    endfor
endfunction

function! darkokai#utils#colors#get_gui_overrides()
    return s:get_color_overrides('gui')
endfunction

function! darkokai#utils#colors#get_cterm_overrides()
    return s:get_color_overrides('cterm')
endfunction

function! darkokai#utils#colors#extend_gui_colors(colors)
    call s:extend_colors(
        \ a:colors,
        \ darkokai#colors#gui#get_colors(),
        \ 'gui'
    \ )
    return a:colors
endfunction

function! darkokai#utils#colors#extend_cterm_colors(colors)
    call s:extend_colors(
        \ a:colors,
        \ (&t_Co > 255
            \ ? darkokai#colors#cterm256#get_colors()
            \ : darkokai#colors#cterm16#get_colors()
        \ ),
        \ 'cterm'
    \ )
    return a:colors
endfunction
