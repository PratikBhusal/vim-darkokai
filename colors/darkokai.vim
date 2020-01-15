if !(has('gui_running') || has('vcon') || has('termguicolors') || &t_Co > 255)
    finish
endif

hi clear

if exists('syntax_on')
    syntax reset
endif

let s:darkokai_debug = get(g:, 'darkokai_debug', 0)

if s:darkokai_debug
    let g:darkokai_highlight_groups = {}
endif


let g:colors_name = 'darkokai'
let s:colors = {}

if has('gui_running') || has('vcon') || has('termguicolors')
    call darkokai#utils#colors#extend_gui_colors(s:colors)

    " :terminal colors {{{
    if has('nvim')
        let g:terminal_color_0  = s:colors.black.gui
        let g:terminal_color_1  = s:colors.red.gui
        let g:terminal_color_2  = s:colors.green.gui
        let g:terminal_color_3  = s:colors.brown.gui
        let g:terminal_color_4  = s:colors.blue.gui
        let g:terminal_color_5  = s:colors.purple.gui
        let g:terminal_color_6  = s:colors.cyan.gui
        let g:terminal_color_7  = s:colors.lightgray.gui
        let g:terminal_color_8  = s:colors.darkgray.gui
        let g:terminal_color_9  = s:colors.red.gui
        let g:terminal_color_10 = s:colors.green.gui
        let g:terminal_color_11 = s:colors.yellow.gui
        let g:terminal_color_12 = s:colors.blue.gui
        let g:terminal_color_13 = s:colors.purple.gui
        let g:terminal_color_14 = s:colors.cyan.gui
        let g:terminal_color_15 = s:colors.white.gui

        let g:terminal_color_background = g:terminal_color_0
        let g:terminal_color_foreground = g:terminal_color_15
    elseif has('terminal')
        let g:terminal_ansi_colors = [
            \ s:colors.black.gui,
            \ s:colors.red.gui,
            \ s:colors.green.gui,
            \ s:colors.brown.gui,
            \ s:colors.blue.gui,
            \ s:colors.purple.gui,
            \ s:colors.cyan.gui,
            \ s:colors.lightgray.gui,
            \ s:colors.darkgray.gui,
            \ s:colors.red.gui,
            \ s:colors.green.gui,
            \ s:colors.yellow.gui,
            \ s:colors.blue.gui,
            \ s:colors.purple.gui,
            \ s:colors.cyan.gui,
            \ s:colors.white.gui,
        \ ]
    endif
    " :terminal colors }}}

endif

if !has('gui_running')
    call darkokai#utils#colors#extend_cterm_colors(s:colors)
endif

function! s:hi(group, fg, bg, style) " {{{
    if s:darkokai_debug && !has_key(g:darkokai_highlight_groups, a:group)
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

function! s:hi_link(from_group, to_group) " {{{
    if s:darkokai_debug && !has_key(g:darkokai_highlight_groups, a:from_group)
        let g:darkokai_highlight_groups[a:from_group] = 'explicit'
    endif

    execute 'highlight! link' a:from_group a:to_group
endfunction " }}}

function! s:hi_clear(group) " {{{
    if s:darkokai_debug && !has_key(g:darkokai_highlight_groups, a:group)
        let g:darkokai_highlight_groups[a:group] = 'explicit'
    endif

    execute 'highlight! clear' a:group
endfunction " }}}

" Highlight Group Color Wrappers {{{
call s:hi('DarkokaiBlackFg',     s:colors.black,     {},                 {})
call s:hi('DarkokaiBlueFg',      s:colors.blue,      {},                 {})
call s:hi('DarkokaiBrownFg',     s:colors.brown,     {},                 {})
call s:hi('DarkokaiGrayFg',      s:colors.gray,      {},                 {})
call s:hi('DarkokaiGreenFg',     s:colors.green,     {},                 {})
call s:hi('DarkokaiLightGrayFg', s:colors.lightgray, {},                 {})
call s:hi('DarkokaiOrangeFg',    s:colors.orange,    {},                 {})
call s:hi('DarkokaiPurpleFg',    s:colors.purple,    {},                 {})
call s:hi('DarkokaiRedFg',       s:colors.red,       {},                 {})
call s:hi('DarkokaiYellowFg',    s:colors.yellow,    {},                 {})

call s:hi('DarkokaiBlackBg',     {},                 s:colors.black,     {})
call s:hi('DarkokaiDarkGrayBg',  {},                 s:colors.darkgray,  {})
call s:hi('DarkokaiGrayBg',      {},                 s:colors.gray,      {})
call s:hi('DarkokaiLightGrayBg', {},                 s:colors.lightgray, {})
" Highlight Group Color Wrappers }}}

" :h highlight-default {{{
call s:hi('DiffAdd',    {},                 s:colors.diffadd,    {})
call s:hi('DiffChange', {},                 s:colors.diffchange, {})
call s:hi('DiffDelete', s:colors.white,     s:colors.diffdel,    {})
call s:hi('DiffText',   s:colors.black,     s:colors.blue,       {})
call s:hi('FoldColumn', s:colors.lightgray,     s:colors.darkgray,   {})
call s:hi('Folded',     s:colors.lightgray, s:colors.darkblack,  {})
call s:hi('LineNr',     s:colors.lightgray, s:colors.darkgray,   {})
call s:hi('Normal',     s:colors.white,     s:colors.black,      {})
call s:hi('Pmenu',      s:colors.blue,      s:colors.darkgray,   {})
call s:hi('PmenuSel',   s:colors.orange,    s:colors.gray,       {})
call s:hi('StatusLine', s:colors.blue,      s:colors.darkgray,   {})
call s:hi('VertSplit',  s:colors.white,     s:colors.darkgray,   {})
call s:hi('WildMenu',   s:colors.orange,    s:colors.gray,       {})

call s:hi('MatchParen', {}, {}, {'format' : 'bold,underline'})
call s:hi('Search',     {}, {}, {'format' : 'reverse,underline'})

call s:hi_link('ColorColumn', 'DarkokaiDarkGrayBg')
call s:hi_link('EndOfBuffer', 'DarkokaiLightGrayFg')
call s:hi_link('PmenuSbar',   'DarkokaiDarkGrayBg')
call s:hi_link('PmenuThumb',  'DarkokaiLightGrayBg')
call s:hi_link('Visual',      'DarkokaiGrayBg')
call s:hi_link('WarningMsg',  'DarkokaiRedFg')

" " TODO {{{
"     Conceal
"     Cursor
"     lCursor
"     CursorIM
"     CorsorColumn
"     CursorLine
"     Directory
"     ErrorMsg
"     IncSearch
"     LineNr
"     LineNrAbove
"     LineNrBelow
"     CursorLineNr
"     ModeMsg
"     MoreMsg
"     NonText
"     Question
"     QuickFixLine
"     SpecialKey
"     SpellBad
"     SpellCap
"     SPellLocal
"     SpellRare
"     StatusLine
"     StatusLineNC
"     StatusLineTerm
"     StatusLineTermNC
"     TabLine
"     TabLineFill
"     Terminal
"     Title
"     VisualNOS
" " TODO }}}

" :h highlight-default }}}

" :h group-name {{{
call s:hi_link('Comment',      'DarkokaiLightGrayFg')
call s:hi_link('Constant',     'DarkokaiPurpleFg')
call s:hi_link('Constant',     'DarkokaiYellowFg')
call s:hi_link('Delimiter',    'DarkokaiLightGrayFg')
call s:hi_link('Function',     'DarkokaiGreenFg')
call s:hi_link('Identifier',   'DarkokaiOrangeFg')
call s:hi_link('Include',      'DarkokaiRedFg')
call s:hi_link('Keyword',      'DarkokaiRedFg')
call s:hi_link('Number',       'DarkokaiPurpleFg')
call s:hi_link('PreProc',      'DarkokaiRedFg')
call s:hi_link('Special',      'DarkokaiPurpleFg')
call s:hi_link('Statement',    'DarkokaiRedFg')
call s:hi_link('StorageClass', 'DarkokaiRedFg')
call s:hi_link('String',       'DarkokaiYellowFg')
call s:hi_link('Structure',    'DarkokaiRedFg')
call s:hi_link('Type',         'DarkokaiBlueFg')

" " TODO {{{
"     Number
"     Boolean
"     Float
"     Conditional
"     Repeat
"     Label
"     Keyword
"     Exception
"     PreProc
"     Define
"     PreCondit
"     Structure
"     Typedef
"     SpecialChar
"     Tag
"     SpecialComment
"     Debug
"     Underlined
"     Ignore
"     Error
"     TODO
" " TODO }}}

" :h group-name }}}

" Filetype Syntax Highlighting {{{

    " Vim {{{
    " call s:hi_link('vimIsCommand', 'DarkokaiOrangeFg')
    call s:hi_link('vimAugroupKey', 'DarkokaiRedFg')
    call s:hi_link('vimAugroup', 'DarkokaiGreenFg')
    call s:hi_link('vimFunction', 'Function')
    call s:hi_link('vimParenSep', 'DarkokaiWhiteFg')
    call s:hi_link('vimUserFunc', 'Function')
    call s:hi_link('vimCommand', 'DarkokaiRedFg')
    " Vim }}}

    " Python {{{
    " Python }}}

    " C/C++ {{{
    call s:hi_link('cDefine', 'DarkokaiGreenFg')
    "  }}}

    " Java {{{
    call s:hi_link('javaFunction', 'Function')
    " Java }}}

    " Doxygen {{{

    " Doxygen }}}

" Filetypes }}}

" Plugins {{{

    " vim-gitgutter {{{
    call s:hi('GitGutterAdd',          s:colors.green,  s:colors.darkgray, {})
    call s:hi('GitGutterChange',       s:colors.yellow, s:colors.darkgray, {})
    call s:hi('GitGutterChangeDelete', s:colors.orange, s:colors.darkgray, {})
    call s:hi('GitGutterDelete',       s:colors.red,    s:colors.darkgray, {})
    " vim-gitgutter }}}

    " NERDTree {{{

    " NERDTree }}}

" Plugins }}}

augroup darkokai_utils " {{{
  autocmd!
  autocmd Syntax * call darkokai#utils#highlight#refresh_highlights()
  autocmd Colorscheme *
    \ if g:colors_name !=# 'darkokai' |
    \   unlet! g:darkokai_highlight_groups |
    \   autocmd! darkokai_utils |
    \   if has('nvim') |
    \   elseif has('terminal') |
    \       unlet  g:terminal_ansi_colors |
    \   endif |
    \ endif
augroup END " }}}

unlet s:colors
delfunction s:hi
delfunction s:hi_link

if  s:darkokai_debug
    let g:darkokai_highlight_groups = keys(g:darkokai_highlight_groups)
endif

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
