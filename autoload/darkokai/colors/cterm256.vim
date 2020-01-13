function! darkokai#colors#cterm256#get_colors()
    let s:overrides = darkokai#utils#colors#get_cterm_overrides()

    return {
        \ 'black'    : { 'cterm' : get( s:overrides, 'black',    '234' ) },
        \ 'blue'     : { 'cterm' : get( s:overrides, 'blue',     '81'  ) },
        \ 'darkgray' : { 'cterm' : get( s:overrides, 'darkgray', '235' ) },
        \ 'green'    : { 'cterm' : get( s:overrides, 'green',    '148' ) },
        \ 'orange'   : { 'cterm' : get( s:overrides, 'orange',   '208' ) },
        \ 'purple'   : { 'cterm' : get( s:overrides, 'purple',   '141' ) },
        \ 'red'      : { 'cterm' : get( s:overrides, 'red',      '197' ) },
        \ 'white'    : { 'cterm' : get( s:overrides, 'white',    '255' ) },
        \ 'yellow'   : { 'cterm' : get( s:overrides, 'yellow',   '186' ) },
    \ }
endfunction
