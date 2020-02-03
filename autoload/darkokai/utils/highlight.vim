function! s:set(group, fg, bg, style) " {{{
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

    if exists('g:darkokai#highlights#defined')
        let g:darkokai#highlights#defined[a:group] = 'explicit'
    endif
endfunction " }}}

function! darkokai#utils#highlight#set(group, fg, bg, ...) " {{{
    call s:set( a:group, a:fg, a:bg, (a:0 != 0 ? a:1 : {}) )
endfunction " }}}

function! s:set_link(from_group, to_group, style) " {{{
    if !empty(a:style)
        let l:to_group_data = darkokai#utils#extract#all_highlights()[a:to_group]

        while has_key(l:to_group_data, 'links')
            let l:to_group_data = darkokai#utils#extract#all_highlights()[l:to_group_data.links]
        endwhile

        call darkokai#utils#highlight#set(a:from_group,
        \   {
        \       'cterm' : has_key(l:to_group_data, 'ctermfg')
        \           ? l:to_group_data.ctermfg
        \           : 'NONE',
        \       'gui'   : has_key(l:to_group_data, 'guifg')
        \           ? l:to_group_data.guifg
        \           : 'NONE'
        \   },
        \   {
        \       'cterm' : has_key(l:to_group_data, 'ctermbg')
        \           ? l:to_group_data.ctermbg
        \           : 'NONE',
        \       'gui'   : has_key(l:to_group_data, 'guibg')
        \           ? l:to_group_data.guibg
        \           : 'NONE'
        \   },
        \   a:style
        \ )
    else
        execute 'highlight! link' a:from_group a:to_group
    endif

    if exists('g:darkokai#highlights#defined')
        let g:darkokai#highlights#defined[a:from_group] = 'link'
    endif
endfunction " }}}

function! darkokai#utils#highlight#set_link(from_group, to_group, ...) " {{{
    call s:set_link( a:from_group, a:to_group, (a:0 != 0 ? a:1 : {}) )
endfunction " }}}

function! darkokai#utils#highlight#clear(group) " {{{
    execute 'highlight! clear' a:group

    if exists('g:darkokai#highlights#defined')
        let g:darkokai#highlights#defined[a:group] = 'cleared'
    endif
endfunction " }}}
