" let s:hi       = function('darkokai#utils#highlight#set')
let s:hi_link  = function('darkokai#utils#highlight#set_link')
" let s:hi_clear = function('darkokai#utils#highlight#clear')

" let s:colors = {}
" if has('gui_running') || has('termguicolors') || has('vcon')
"     call darkokai#utils#colors#extend_gui_colors(s:colors)
" endif
" if !has('gui_running')
"     call darkokai#utils#colors#extend_cterm_colors(s:colors)
" endif

function! s:vim()
    call s:hi_link('vimAugroup',    'DarkokaiGreenFg')
    call s:hi_link('vimAugroupKey', 'DarkokaiRedFg')
    call s:hi_link('vimCommand',    'DarkokaiRedFg')
    call s:hi_link('vimFuncSID',    'vimFunction')
    call s:hi_link('vimFunction',   'Function')
    call s:hi_link('vimParenSep',   'vimSep')
    call s:hi_link('vimUserFunc',   'vimFunction')

    autocmd! darkokai_utils FileType vim
endfunction

function! s:doxygen()
    call s:hi_link('doxygenDescription', 'DarkokaiLightGrayFg', {'format'  : 'bold'})
    call s:hi_link('doxygenParamName',   'DarkokaiOrangeFg',    {'format': 'underline'})

    call s:hi_link('doxygenBody',                 'DarkokaiLightGrayFg')
    call s:hi_link('doxygenBrief',                'DarkokaiWhiteFg')
    call s:hi_link('doxygenComment',              'DarkokaiBlueFg')
    call s:hi_link('doxygenLeadingWhite',         'doxygenDescription')
    call s:hi_link('doxygenParam',                'DarkokaiRedFg')
    call s:hi_link('doxygenSpecial',              'doxygenParam')
    call s:hi_link('doxygenSpecialMultilineDesc', 'DarkokaiWhiteFg')

    autocmd! darkokai_utils FileType doxygen
endfunction

function! s:c()
    call s:hi_link('cBlock',  'DarkokaiLightGrayFg')
    call s:hi_link('cDefine', 'DarkokaiGreenFg')

    autocmd! darkokai_utils FileType c
endfunction

function! s:cpp()
    if exists('#darkokai_utils#FileType#c')
        call s:c()
    endif
    if exists('#darkokai_utils#FileType#doxygen')
        call s:doxygen()
    endif

    call s:hi_link('cCustomScope',    'DarkokaiLightGrayFg')
    call s:hi_link('cppSTLconstant',  'DarkokaiWhiteFg')
    call s:hi_link('cppSTLios',       'DarkokaiWhiteFg')
    call s:hi_link('cppSTLnamespace', 'DarkokaiGreenFg')

    autocmd! darkokai_utils FileType cpp
endfunction

function! s:java()
    if exists('#darkokai_utils#FileType#doxygen')
        call s:doxygen()
    endif

    call s:hi_link('javaFunction', 'Function')

    autocmd! darkokai_utils FileType java
endfunction

function! darkokai#ftplugin#reload_filetype()
    if !exists('#darkokai_utils#FileType#' . &filetype)
        finish
    endif

    let l:filetype_function = 's:' . &filetype
    if exists('*' . l:filetype_function)
        exec 'call' l:filetype_function . '()'
    elseif get(g:, 'darkokai#debug', 0)
        echoerr 'Found filetype that has no configurations'
    endif

    if get(g:, 'darkokai#debug', 0)
        call darkokai#utils#extract#refresh_highlights()
    endif
endfunction
