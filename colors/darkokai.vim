if !(
\   has('gui_running') ||
\   has('vcon') ||
\   has('termguicolors') ||
\   &t_Co > 15
\ )
    finish
endif

hi clear

if exists('syntax_on')
    syntax reset
endif

if get(g:, 'darkokai#debug', v:false)
    let g:darkokai#highlights#defined = {}
endif


let g:colors_name = 'darkokai'
let s:colors = {}

if has('gui_running') || has('termguicolors') || has('vcon')
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
        \   s:colors.black.gui,
        \   s:colors.red.gui,
        \   s:colors.green.gui,
        \   s:colors.brown.gui,
        \   s:colors.blue.gui,
        \   s:colors.purple.gui,
        \   s:colors.cyan.gui,
        \   s:colors.lightgray.gui,
        \   s:colors.darkgray.gui,
        \   s:colors.red.gui,
        \   s:colors.green.gui,
        \   s:colors.yellow.gui,
        \   s:colors.blue.gui,
        \   s:colors.purple.gui,
        \   s:colors.cyan.gui,
        \   s:colors.white.gui,
        \ ]
    endif
    " :terminal colors }}}

endif

if !has('gui_running')
    call darkokai#utils#colors#extend_cterm_colors(s:colors)
endif

let s:hi       = function('darkokai#utils#highlight#set')
let s:hi_link  = function('darkokai#utils#highlight#set_link')
let s:hi_clear = function('darkokai#utils#highlight#clear')

" Highlight Group Color Wrappers {{{
call s:hi('DarkokaiBlackFg',     s:colors.black,     {})
call s:hi('DarkokaiBlueFg',      s:colors.blue,      {})
call s:hi('DarkokaiBrownFg',     s:colors.brown,     {})
call s:hi('DarkokaiGrayFg',      s:colors.gray,      {})
call s:hi('DarkokaiGreenFg',     s:colors.green,     {})
call s:hi('DarkokaiLightGrayFg', s:colors.lightgray, {})
call s:hi('DarkokaiOrangeFg',    s:colors.orange,    {})
call s:hi('DarkokaiPurpleFg',    s:colors.purple,    {})
call s:hi('DarkokaiRedFg',       s:colors.red,       {})
call s:hi('DarkokaiYellowFg',    s:colors.yellow,    {})
call s:hi('DarkokaiCyanFg',      s:colors.cyan,      {})
call s:hi('DarkokaiBlackBg',     {},                 s:colors.black)
call s:hi('DarkokaiDarkGrayBg',  {},                 s:colors.darkgray)
call s:hi('DarkokaiGrayBg',      {},                 s:colors.gray)
call s:hi('DarkokaiLightGrayBg', {},                 s:colors.lightgray)
" Highlight Group Color Wrappers }}}

" :h highlight-default {{{
call s:hi('DiffAdd',      {},                 s:colors.diffadd)
call s:hi('DiffChange',   {},                 s:colors.diffchange)
call s:hi('DiffDelete',   s:colors.white,     s:colors.diffdel)
call s:hi('DiffText',     s:colors.black,     s:colors.blue)
call s:hi('FoldColumn',   s:colors.lightgray, s:colors.darkgray)
call s:hi('Folded',       s:colors.lightgray, s:colors.darkblack)
call s:hi('LineNr',       s:colors.lightgray, s:colors.darkgray)
call s:hi('Normal',       s:colors.white,     s:colors.black)
call s:hi('Pmenu',        s:colors.blue,      s:colors.darkgray)
call s:hi('PmenuSel',     s:colors.orange,    s:colors.gray)
call s:hi('StatusLineNC', s:colors.white,     s:colors.gray )
call s:hi('StatusLine',   s:colors.blue,      s:colors.darkgray)
call s:hi('VertSplit',    s:colors.white,     s:colors.darkgray)
call s:hi('WildMenu',     s:colors.orange,    s:colors.gray)

call s:hi('MatchParen', {}, {}, {'format' : 'bold,underline'})
call s:hi('Search',     {}, {}, {'format' : 'reverse,underline'})

call s:hi('CursorLineNr', s:colors.yellow, s:colors.darkgray, {'format': 'bold'})

call s:hi_link('ColorColumn', 'DarkokaiDarkGrayBg')
call s:hi_link('Directory',   'DarkokaiBlueFg')
call s:hi_link('EndOfBuffer', 'DarkokaiLightGrayFg')
call s:hi_link('MoreMsg',     'DarkokaiYellowFg')
call s:hi_link('PmenuSbar',   'DarkokaiDarkGrayBg')
call s:hi_link('PmenuThumb',  'DarkokaiLightGrayBg')
call s:hi_link('Question',    'DarkokaiYellowFg')
call s:hi_link('SpecialKey',  'DarkokaiDarkGrayFg')
call s:hi_link('Visual',      'DarkokaiGrayBg')
call s:hi_link('WarningMsg',  'DarkokaiRedFg')

call s:hi_clear('LineNrAbove')
call s:hi_clear('LineNrBelow')

if !has('nvim')
    call s:hi_clear('CursorLine')
else
    call s:hi_link('CursorLine', 'DarkokaiGrayBg')
endif

call s:hi_link('ModeMsg', 'Normal', {'format' : 'bold'})

" " TODO {{{
"     Conceal
"     Cursor
"     lCursor
"     CursorIM
"     CorsorColumn
"     Directory
"     ErrorMsg
"     IncSearch
"     ModeMsg
"     NonText
"     Question
"     QuickFixLine
"     SpecialKey
"     SpellBad
"     SpellCap
"     SPellLocal
"     SpellRare
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
call s:hi_link('Comment',        'DarkokaiLightGrayFg')
call s:hi_link('SpecialComment', 'Comment')
call s:hi_link('Constant',       'DarkokaiPurpleFg')
call s:hi_link('Delimiter',      'DarkokaiLightGrayFg')
call s:hi_link('Function',       'DarkokaiGreenFg')
call s:hi_link('Identifier',     'DarkokaiOrangeFg')
call s:hi_link('Include',        'DarkokaiRedFg')
call s:hi_link('Keyword',        'DarkokaiRedFg')
call s:hi_link('Number',         'DarkokaiPurpleFg')
call s:hi_link('PreProc',        'DarkokaiRedFg')
call s:hi_link('Special',        'DarkokaiPurpleFg')
call s:hi_link('Statement',      'DarkokaiRedFg')
call s:hi_link('StorageClass',   'DarkokaiRedFg')
call s:hi_link('String',         'DarkokaiYellowFg')
call s:hi_link('Structure',      'DarkokaiRedFg')
call s:hi_link('Type',           'DarkokaiBlueFg')
call s:hi_link('Define',         'DarkokaiRedFg')
call s:hi_link('Macro',          'DarkokaiGreenFg')

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
"     Debug
"     Underlined
"     Ignore
"     Error
"     TODO
" " TODO }}}

" :h group-name }}}

" Misc {{{
call s:hi_link('diffRemoved', 'DarkokaiRedFg')
call s:hi_link('diffAdded', 'DarkokaiGreenFg')
" Misc }}}

" Filetypes {{{

    " Vim {{{
    call s:hi_link('vimAugroupKey', 'DarkokaiRedFg')
    call s:hi_link('vimAugroup', 'DarkokaiGreenFg')
    call s:hi_link('vimFunction', 'Function')
    call s:hi_link('vimParenSep', 'vimSep')
    call s:hi_link('vimUserFunc', 'Function')
    call s:hi_link('vimCommand', 'DarkokaiRedFg')
    " Vim }}}

    " Python {{{
    " Python }}}

    " C/C++ {{{
    call s:hi_link('cDefine', 'Define')
    call s:hi_link('cCustomScope', 'DarkokaiLightGrayFg')
    call s:hi_link('cppSTLnamespace', 'DarkokaiGreenFg')
    call s:hi_link('cppSTLconstant', 'DarkokaiWhiteFg')
    call s:hi_link('cppSTLios', 'DarkokaiWhiteFg')
    call s:hi_link('cBlock', 'DarkokaiLightGrayFg')
    "  }}}

    " Java {{{
    call s:hi_link('javaFunction', 'Function')
    " Java }}}

    " Doxygen {{{
    call s:hi('doxygenDescription', s:colors.lightgray, {}, {'format' : 'bold'})

    call s:hi_link('doxygenParamName', 'DarkokaiOrangeFg', {'format': 'underline'})

    call s:hi_link('doxygenComment',            'DarkokaiLightGrayFg')
    call s:hi_link('doxygenBrief',              'doxygenDescription')
    call s:hi_link('doxygenComment',            'DarkokaiBlueFg')
    call s:hi_link('doxygenBody',               'DarkokaiLightGrayFg')
    call s:hi_link('doxygenLeadingWhite',       'doxygenDescription')
    call s:hi_link('doxygenParam',              'DarkokaiRedFg')
    call s:hi_link('doxygenSpecial',            'doxygenParam')
    call s:hi_link('doxygenSpecialOnelineDesc', 'doxygenDescription')
    " Doxygen }}}

" Filetypes }}}

" Plugins {{{

    " vim-gitgutter {{{
    call s:hi('GitGutterAdd',          s:colors.green,  s:colors.darkgray)
    call s:hi('GitGutterChange',       s:colors.yellow, s:colors.darkgray)
    call s:hi('GitGutterChangeDelete', s:colors.orange, s:colors.darkgray)
    call s:hi('GitGutterDelete',       s:colors.red,    s:colors.darkgray)
    " vim-gitgutter }}}

    " NERDTree {{{
    call s:hi_link('NERDTreeExecFile', 'DarkokaiGreenFg')
    call s:hi_link('NERDTreeLinkFile', 'DarkokaiCyanFg')
    " NERDTree }}}

    " Rainbow Parenthesis {{{
    let g:rainbow_conf = get(g:, 'rainbow_conf', {})
    if has('gui_running') || has('termguicolors') || has('vcon')
        let g:rainbow_conf['guifgs'] = [
        \   s:colors.lightgray.gui,
        \   s:colors.blue.gui,
        \   s:colors.yellow.gui,
        \   s:colors.diffchange.gui,
        \ ]
    endif
    if !has('gui_running')
        let g:rainbow_conf['ctermfgs'] = [
        \   s:colors.lightgray.cterm,
        \   s:colors.blue.cterm,
        \   s:colors.yellow.cterm,
        \   s:colors.diffchange.cterm,
        \ ]
    endif
    " Rainbow Parenthesis }}}
" Plugins }}}

augroup darkokai_utils " {{{
    autocmd!
    autocmd Colorscheme * call darkokai#utils#cleanup#settings()
    autocmd Syntax      * call darkokai#utils#extract#refresh_highlights()
augroup END " }}}

unlet s:colors

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

call darkokai#utils#extract#refresh_highlights()
