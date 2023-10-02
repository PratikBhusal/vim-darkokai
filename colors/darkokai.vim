if !(
\   has('gui_running')    ||
\   has('vcon')           ||
\   has('termguicolors')  ||
\   &t_Co > 15
\ )
    finish
endif

hi clear

if exists('syntax_on')
    syntax reset
endif

if get(g:, 'darkokai#debug', 0)
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
call s:hi('DarkokaiBlackFg',      s:colors.black,     {})
call s:hi('DarkokaiBlueFg',       s:colors.blue,      {})
call s:hi('DarkokaiBrownFg',      s:colors.brown,     {})
call s:hi('DarkokaiCyanFg',       s:colors.cyan,      {})
call s:hi('DarkokaiGrayFg',       s:colors.gray,      {})
call s:hi('DarkokaiGreenFg',      s:colors.green,     {})
call s:hi('DarkokaiLightGrayFg',  s:colors.lightgray, {})
call s:hi('DarkokaiOrangeFg',     s:colors.orange,    {})
call s:hi('DarkokaiPurpleFg',     s:colors.purple,    {})
call s:hi('DarkokaiTextFg',       s:colors.difftext,  {})
call s:hi('DarkokaiRedFg',        s:colors.red,       {})
call s:hi('DarkokaiWhiteFg',      s:colors.white,     {})
call s:hi('DarkokaiYellowFg',     s:colors.yellow,    {})
call s:hi('DarkokaiBlackBg',      {},                 s:colors.black)
call s:hi('DarkokaiDarkGrayBg',   {},                 s:colors.darkgray)
call s:hi('DarkokaiDiffAddBg',    {},                 s:colors.diffadd)
call s:hi('DarkokaiDiffChangeBg', {},                 s:colors.diffchange)
call s:hi('DarkokaiDimGrayBg',    {},                 s:colors.dimgray)
call s:hi('DarkokaiGrayBg',       {},                 s:colors.gray)
call s:hi('DarkokaiLightGrayBg',  {},                 s:colors.lightgray)
" Testing line here!
" Highlight Group Color Wrappers }}}

" :h highlight-default {{{
call s:hi('DiffDelete',   s:colors.gray, s:colors.diffdel)
call s:hi('DiffText',     s:colors.black,     s:colors.difftext)
call s:hi('FoldColumn',   s:colors.lightgray, s:colors.darkgray)
call s:hi('Folded',       s:colors.lightgray, s:colors.darkblack)
call s:hi('LineNr',       s:colors.lightgray, s:colors.darkgray)
call s:hi('Normal',       s:colors.white,     s:colors.black)
call s:hi('Pmenu',        s:colors.blue,      s:colors.darkgray)
call s:hi('PmenuSel',     s:colors.orange,    s:colors.gray)
call s:hi('StatusLineNC', s:colors.white,     s:colors.gray )
call s:hi('StatusLine',   s:colors.blue,      s:colors.darkgray)
call s:hi('TabLine',      s:colors.white,     s:colors.darkgray)
call s:hi('TabLineSel',   s:colors.blue,      s:colors.darkgray)
call s:hi('VertSplit',    s:colors.white,     s:colors.darkgray)
call s:hi('WildMenu',     s:colors.orange,    s:colors.gray)

call s:hi('IncSearch',  {}, {}, {'format' : 'bold,reverse'})
call s:hi('MatchParen', {}, {}, {'format' : 'bold,underline'})
call s:hi('Search',     {}, {}, {'format' : 'reverse,underline'})

call s:hi('CursorLineNr', s:colors.yellow, s:colors.darkgray, {'format': 'bold'})

call s:hi_link('ColorColumn', 'DarkokaiDarkGrayBg')
call s:hi_link('DiffAdd',     'DarkokaiDiffAddBg')
call s:hi_link('DiffChange',  'DarkokaiDiffChangeBg')
call s:hi_link('Directory',   'DarkokaiBlueFg')
call s:hi_link('EndOfBuffer', 'DarkokaiBlackFg')
call s:hi_link('ErrorMsg',    'DarkokaiRedFg')
call s:hi_link('MoreMsg',     'DarkokaiYellowFg')
call s:hi_link('PmenuSbar',   'DarkokaiDarkGrayBg')
call s:hi_link('PmenuThumb',  'DarkokaiLightGrayBg')
call s:hi_link('Question',    'DarkokaiYellowFg')
call s:hi_link('SignColumn',  'LineNr')
call s:hi_link('SpecialKey',  'DarkokaiDarkGrayFg')
call s:hi_link('TabLineFill', 'DarkokaiDarkGrayBg')
call s:hi_link('Title',       'DarkokaiYellowFg')
call s:hi_link('Visual',      'DarkokaiGrayBg')
call s:hi_link('WarningMsg',  'DarkokaiRedFg')
call s:hi_link('Whitespace',  'DarkokaiDarkGrayFg')

call s:hi_clear('LineNrAbove')
call s:hi_clear('LineNrBelow')

if !has('nvim')
    call s:hi_clear('CursorLine')
else
    call s:hi_link('CursorLine', 'DarkokaiDimGrayBg')
endif

call s:hi_link('ModeMsg', 'Normal', {'format' : 'bold'})

" " TODO {{{
"     Conceal
"     Cursor
"     lCursor
"     CursorIM
"     CorsorColumn
"     NonText
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
call s:hi_link('Constant',       'DarkokaiPurpleFg')
call s:hi_link('Define',         'DarkokaiRedFg')
call s:hi_link('Delimiter',      'DarkokaiLightGrayFg')
call s:hi_link('Function',       'DarkokaiGreenFg')
call s:hi_link('Identifier',     'DarkokaiOrangeFg')
call s:hi_link('Include',        'DarkokaiRedFg')
call s:hi_link('Keyword',        'DarkokaiRedFg')
call s:hi_link('Macro',          'DarkokaiGreenFg')
call s:hi_link('PreProc',        'DarkokaiRedFg')
call s:hi_link('SpecialComment', 'Comment')
call s:hi_link('Special',        'DarkokaiPurpleFg')
call s:hi_link('Statement',      'DarkokaiRedFg')
call s:hi_link('StorageClass',   'DarkokaiRedFg')
call s:hi_link('String',         'DarkokaiYellowFg')
call s:hi_link('Structure',      'DarkokaiRedFg')
call s:hi_link('Type',           'DarkokaiBlueFg')

call s:hi_link('Underlined', 'DarkokaiLightGrayFg', {'format' : 'underline'})

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
"     Ignore
"     Error
"     TODO
" " TODO }}}

" :h group-name }}}

" Git-specific highlights {{{

" Reference: /usr/share/vim/vim90/syntax/git.vim

call s:hi_link('diffAdded',   'DarkokaiGreenFg')
call s:hi_link('diffChanged', 'DarkokaiTextFg')
call s:hi_link('diffRemoved', 'DarkokaiRedFg')

" Git-specific highlights }}}

" Use default highlight for the following highlgiht groups {{{
if exists('g:darkokai#highlights#defined')
    for s:group in [
    \   'Number',
    \   'Float'
    \ ]
        call extend(g:darkokai#highlights#defined, {s:group : 'Default'})
    endfor
endif
" Use default highlight for the following highlgiht groups }}}

" Plugins {{{

    " vim-gitgutter {{{
    call s:hi('GitGutterAdd',          s:colors.green,  s:colors.darkgray)
    call s:hi('GitGutterChangeDelete', s:colors.orange, s:colors.darkgray)
    call s:hi('GitGutterChange',       s:colors.yellow, s:colors.darkgray)
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
        \   s:colors.orange.gui,
        \   s:colors.green.gui,
        \   s:colors.green.gui,
        \ ]
    endif
    if !has('gui_running')
        let g:rainbow_conf['ctermfgs'] = [
        \   s:colors.lightgray.cterm,
        \   s:colors.blue.cterm,
        \   s:colors.orange.cterm,
        \   s:colors.green.cterm,
        \   s:colors.red.cterm,
        \ ]
    endif
    " Rainbow Parenthesis }}}

    " hiPairs {{{
    let g:hiPairs_enable_matchParen = 0

    let g:hiPairs_hl_matchPair = get(
        \   g:,
        \   'hiPairs_hl_matchPair',
        \   {'term': 'bold,underline'}
    \ )
    let g:hiPairs_hl_unmatchPair = get(
        \   g:,
        \   'hiPairs_hl_unmatchPair',
        \   {'term': 'bold,underline'}
    \ )

    if has('gui_running') || has('termguicolors') || has('vcon')
        let g:hiPairs_hl_matchPair['gui'] = 'bold'
        let g:hiPairs_hl_matchPair['guifg'] = s:colors.yellow.gui
        let g:hiPairs_hl_matchPair['guibg'] = s:colors.black.gui

        let g:hiPairs_hl_unmatchPair['gui'] = 'bold'
        let g:hiPairs_hl_unmatchPair['guifg'] = s:colors.white.gui
        let g:hiPairs_hl_unmatchPair['guibg'] = s:colors.red.gui
    endif
    if !has('gui_running')
        let g:hiPairs_hl_matchPair['cterm'] = 'bold'
        let g:hiPairs_hl_matchPair['ctermfg'] = s:colors.yellow.cterm
        let g:hiPairs_hl_matchPair['ctermbg'] = s:colors.black.cterm

        let g:hiPairs_hl_unmatchPair['cterm'] = 'bold'
        let g:hiPairs_hl_unmatchPair['ctermfg'] = s:colors.white.cterm
        let g:hiPairs_hl_unmatchPair['ctermbg'] = s:colors.red.cterm
    endif
    " hiPairs }}}
" Plugins }}}

augroup darkokai_utils " {{{
    autocmd!
    autocmd Colorscheme * call darkokai#utils#cleanup#settings()
    autocmd Filetype
    \   c,cpp,vim,doxygen,java,html,markdown
    \   call darkokai#ftplugin#reload_filetype()
augroup END " }}}

unlet s:colors

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

if get(g:, 'darkokai#debug', 0)
    call darkokai#utils#extract#refresh_highlights()
    autocmd darkokai_utils Syntax * call darkokai#utils#extract#refresh_highlights()
    command! -nargs=0 HlTrace :echo darkokai#utils#debug#trace()
endif
