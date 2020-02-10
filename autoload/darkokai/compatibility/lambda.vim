function! darkokai#compatibility#lambda#color_override(val, target) abort
    return get(a:val, a:target, '')
endfunction


function! darkokai#compatibility#lambda#highlight_map_split(colors) abort
    return map(
    \   map(
    \       a:colors,
    \       "split(v:val, '=')"
    \   ),
    \   '{v:val[0]: v:val[1]}'
    \  )
endfunction
