function! darkokai#utils#cleanup#settings()
    if g:colors_name !=# 'darkokai'
        unlet! g:darkokai#highlights#defined
        unlet! g:darkokai#highlights#undefined

        if has('nvim')
            unlet!  g:terminal_color_0
            unlet!  g:terminal_color_1
            unlet!  g:terminal_color_2
            unlet!  g:terminal_color_3
            unlet!  g:terminal_color_4
            unlet!  g:terminal_color_5
            unlet!  g:terminal_color_6
            unlet!  g:terminal_color_7
            unlet!  g:terminal_color_8
            unlet!  g:terminal_color_9
            unlet!  g:terminal_color_10
            unlet!  g:terminal_color_11
            unlet!  g:terminal_color_12
            unlet!  g:terminal_color_13
            unlet!  g:terminal_color_14
            unlet!  g:terminal_color_15
            unlet!  g:terminal_color_foreground
            unlet!  g:terminal_color_background
        elseif has('terminal')
            unlet! g:terminal_ansi_colors
        endif

        autocmd! darkokai_utils
    endif
endfunction
