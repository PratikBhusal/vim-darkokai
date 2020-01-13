if !(has('gui_running') || has('vcon') || has('termguicolors') || &t_Co > 255)
    finish
endif

let g:colors_name = 'darkokai'
let g:darkokai_defined_highlight_groups = {}
let s:colors = {}

if has('gui_running') || has('vcon') || has('termguicolors')
    call darkokai#utils#colors#extend_gui_colors(s:colors)
endif

if !has('gui_running')
    call darkokai#utils#colors#extend_cterm_colors(s:colors)
endif

function! s:hi(group, fg, bg, style) "{{{
    if !has_key(g:darkokai_defined_highlight_groups, a:group)
        let g:darkokai_defined_highlight_groups[a:group] = 'explicit'
    endif
    execute 'highlight' a:group
        \ 'ctermbg=' . (has_key(a:bg,    'cterm') ? a:bg.cterm    : 'NONE')
        \ 'ctermfg=' . (has_key(a:fg,    'cterm') ? a:fg.cterm    : 'NONE')
        \
        \ 'guibg='   . (has_key(a:bg,    'gui')   ? a:bg.gui      : 'NONE')
        \ 'guifg='   . (has_key(a:fg,    'gui')   ? a:fg.gui      : 'NONE')
        \
        \ 'cterm='   . (has_key(a:style, 'cterm') ? a:style.cterm : 'NONE')
        \ 'term='    . (has_key(a:style, 'term')  ? a:style.term  : 'NONE')
        \
        \ 'gui='     . (has_key(a:style, 'gui')   ? a:style.gui   : 'NONE')
        \ 'guisp='   . (has_key(a:style, 'guisp') ? a:style.guisp : 'NONE')
endfunction "}}}

function! s:hi_link(from_group, to_group) "{{{
    if !has_key(g:darkokai_defined_highlight_groups, a:from_group)
        let g:darkokai_defined_highlight_groups[a:from_group] = 'explicit'
    endif

    execute 'highlight! link' a:from_group a:to_group
endfunction "}}}

" Highlight Group Color Wrappers {{{
call s:hi('DarkokaiBlack',  s:colors.blue,   {}, {})
call s:hi('DarkokaiBlue',   s:colors.blue,   {}, {})
call s:hi('DarkokaiGreen',  s:colors.green,  {}, {})
call s:hi('DarkokaiYellow', s:colors.yellow, {}, {})
call s:hi('DarkokaiOrange', s:colors.orange, {}, {})
call s:hi('DarkokaiPurple', s:colors.purple, {}, {})
call s:hi('DarkokaiRed',    s:colors.red,    {}, {})
" Highlight Group Color Wrappers }}}

" :h highlight-default {{{
call s:hi('ColorColumn', {},             s:colors.darkgray, {})
call s:hi('LineNr',      s:colors.white, s:colors.darkgray, {})
call s:hi('Normal',      s:colors.white, s:colors.black,    {})
call s:hi('Folded',      s:colors.white, s:colors.darkgray, {})
call s:hi('FoldColumn',  s:colors.blue,  s:colors.darkgray, {})
call s:hi('VertSplit',   s:colors.white, s:colors.darkgray, {})
" :h highlight-default }}}

" :h group-name {{{
call s:hi_link('Function',     'DarkokaiGreen')
call s:hi_link('Identifier',   'DarkokaiOrange')
call s:hi_link('PreProc',      'DarkokaiRed')
call s:hi_link('Structure',    'DarkokaiRed')
call s:hi_link('Keyword',      'DarkokaiRed')
call s:hi_link('Include',      'DarkokaiRed')
call s:hi_link('Number',       'DarkokaiPurple')
call s:hi_link('Statement',    'DarkokaiRed')
call s:hi_link('String',       'DarkokaiYellow')
call s:hi_link('Type',         'DarkokaiBlue')
call s:hi_link('StorageClass', 'DarkokaiRed')
" :h group-name }}}

" Filetype Syntax Highlighting {{{

    " Vim {{{
    hi! link vimUserFunc DarkokaiBlue
    " Vim }}}

    " Java {{{
    call s:hi_link('javaFunction', 'DarkokaiGreen')
    " Java }}}

" Filetypes }}}

unlet s:colors

augroup darkokai_utils "{{{
  autocmd!
  autocmd Syntax * call darkokai#utils#highlight#refresh_highlights()
  autocmd Colorscheme *
    \ if g:colors_name !=# 'darkokai' |
    \   unlet! g:darkokai_defined_highlight_groups |
    \   autocmd! darkokai_utils |
    \ endif
augroup END "}}}
