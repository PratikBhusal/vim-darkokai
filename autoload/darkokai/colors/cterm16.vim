function! darkokai#colors#cterm16#get_colors()
    let s:overrides = darkokai#utils#colors#get_cterm_overrides()

    return {
        \ 'black' : {'cterm' : get(s:overrides, 'black', '15')}
    \ }
endfunction
