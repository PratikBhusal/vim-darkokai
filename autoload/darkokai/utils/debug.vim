function! darkokai#utils#debug#trace() " {{{

    let l:syntax_trace = 'SynStack:'
    let l:idlist       = synstack( line('.'), col('.') )

    if !empty(l:idlist)
        let l:syntax_trace = l:syntax_trace . '   ' . synIDattr(l:idlist[0], 'name')
        for id in idlist[1:]
            let l:syntax_trace = l:syntax_trace . ' -> ' . synIDattr(l:id, 'name')
        endfor

        let l:highlight_name  = synIDattr(l:idlist[-1], 'name')
        let l:highlight_trace = 'HltTrace:   ' . l:highlight_name

        if !has_key(darkokai#utils#extract#all_highlights(), l:highlight_name)
            call darkokai#utils#extract#refresh_highlights()
        endif
        let l:highlights = darkokai#utils#extract#all_highlights()

        let l:highlight_data  = l:highlights[l:highlight_name]
        while has_key(l:highlight_data, 'links')
            let l:highlight_name  = l:highlight_data.links
            let l:highlight_trace = l:highlight_trace . ' -> ' . l:highlight_name
            let l:highlight_data  = l:highlights[l:highlight_name]
        endwhile

        " TODO: Find way to show the color next to the #rrggbb/cterm cterm
        " value.
        let l:fg = has_key(l:highlight_data, 'guifg')
        \   ? l:highlight_data.guifg
        \   : has_key(l:highlight_data, 'ctermfg')
        \       ? l:highlight_data.ctermfg
        \       : 'NONE'
        let l:bg = has_key(l:highlight_data, 'guibg')
        \   ? l:highlight_data.guibg
        \   : has_key(l:highlight_data, 'ctermbg')
        \       ? l:highlight_data.ctermbg
        \       : 'NONE'

        return l:syntax_trace . "\n" .
        \      l:highlight_trace .
        \      "\nForeground: " . l:fg .
        \      "\nBackground: " . l:bg
    endif

    return l:syntax_trace
endfunction " }}}
