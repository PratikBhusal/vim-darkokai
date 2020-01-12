if !(has('gui_running') || has('vcon') || has('termguicolors') || &t_Co > 255)
    finish
endif

let g:colors_name = 'darkokai'

let s:colors = {}

if has('gui_running') || has('vcon') || has('termguicolors')
    call darkokai#utils#colors#extend_gui_colors(s:colors)
endif

if !has('gui_running')
    call darkokai#utils#colors#extend_cterm_colors(s:colors)
endif

function! s:hi(group, fg, bg, style)
    execute 'highlight' a:group
        \ 'ctermbg=' . (has_key(a:bg, 'cterm') ? a:bg.cterm : 'NONE')
        \ 'ctermfg=' . (has_key(a:fg, 'cterm') ? a:fg.cterm : 'NONE')
        \
        \ 'guibg=' . (has_key(a:bg, 'gui') ? a:bg.gui : 'NONE')
        \ 'guifg=' . (has_key(a:fg, 'gui') ? a:fg.gui : 'NONE')
        \
        \ 'cterm=' . (has_key(a:style, 'cterm') ? a:style.cterm : 'NONE')
        \ 'term=' . (has_key(a:style, 'term')  ? a:style.term  : 'NONE')
        \
        \ 'gui='   . (has_key(a:style, 'gui')   ? a:style.gui   : 'NONE')
        \ 'guisp=' . (has_key(a:style, 'guisp') ? a:style.guisp : 'NONE')
endfunction

" Highlight Group Color Wrappers {{{
call s:hi('DarkokaiBlack',  s:colors.blue,   {}, {})
call s:hi('DarkokaiBlue',   s:colors.blue,   {}, {})
call s:hi('DarkokaiGreen',  s:colors.green,  {}, {})
call s:hi('DarkokaiYellow', s:colors.yellow,  {}, {})
call s:hi('DarkokaiOrange', s:colors.orange, {}, {})
" Highlight Group Color Wrappers }}}

" :h highlight-default {{{
call s:hi('ColorColumn', {}, s:colors.darkgray, {})
call s:hi('LineNr', s:colors.white, s:colors.darkgray, {})
call s:hi('Normal', s:colors.white, s:colors.black, {})
call s:hi('Folded', s:colors.white, s:colors.darkgray, {})
call s:hi('FoldColumn', s:colors.blue, s:colors.darkgray, {})
call s:hi('VertSplit', s:colors.white, s:colors.darkgray, {})
" :h highlight-default }}}

" :h group-name {{{
hi! link String DarkokaiYellow
hi! link Function DarkokaiGreen
hi! link Type DarkokaiBlue
" :h group-name }}}

" Filetype Syntax Highlighting {{{

    " Vim {{{
    hi! link vimUserFunc DarkokaiBlue
    " Vim }}}


" Filetypes }}}

augroup darkokai_utils
  autocmd!
  autocmd Syntax * call darkokai#utils#highlight#refresh_highlights()
  autocmd Colorscheme *
    \ if g:colors_name !=# 'darkokai'
    \ | autocmd! darkokai_utils
    \ | endif
augroup END

unlet s:colors
