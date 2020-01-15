function! darkokai#utils#highlight#set(group, fg, bg, style) " {{{
    if exists('g:darkokai_highlight_groups') && !has_key(g:darkokai_highlight_groups, a:group)
        let g:darkokai_highlight_groups[a:group] = 'explicit'
    endif

    execute 'highlight!' a:group
        \ 'ctermbg=' . (has_key(a:bg,    'cterm')  ? a:bg.cterm     : 'NONE')
        \ 'ctermfg=' . (has_key(a:fg,    'cterm')  ? a:fg.cterm     : 'NONE')
        \
        \ 'guibg='   . (has_key(a:bg,    'gui')    ? a:bg.gui       : 'NONE')
        \ 'guifg='   . (has_key(a:fg,    'gui')    ? a:fg.gui       : 'NONE')
        \
        \ 'cterm='   . (has_key(a:style, 'format') ? a:style.format : 'NONE')
        \ 'gui='     . (has_key(a:style, 'format') ? a:style.format : 'NONE')
        \ 'guisp='   . (has_key(a:style, 'guisp')  ? a:style.guisp  : 'NONE')
endfunction " }}}

function! darkokai#utils#highlight#set_link(from_group, to_group) " {{{
    if exists('g:darkokai_highlight_groups') && !has_key(g:darkokai_highlight_groups, a:from_group)
        let g:darkokai_highlight_groups[a:from_group] = 'explicit'
    endif

    execute 'highlight! link' a:from_group a:to_group
endfunction " }}}

function! darkokai#utils#highlight#clear(group) " {{{
    if exists('g:darkokai_highlight_groups') && !has_key(g:darkokai_highlight_groups, a:group)
        let g:darkokai_highlight_groups[a:group] = 'explicit'
    endif

    execute 'highlight! clear' a:group
endfunction " }}}
