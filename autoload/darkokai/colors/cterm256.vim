function! darkokai#colors#cterm256#get_colors()
    let s:overrides = darkokai#utils#colors#get_cterm_overrides()

    return {
        \ 'black'      : { 'cterm' : get( s:overrides, 'black',      '234' ) },
        \ 'blue'       : { 'cterm' : get( s:overrides, 'blue',       '81'  ) },
        \ 'brown'      : { 'cterm' : get( s:overrides, 'brown',      '242' ) },
        \ 'cyan'       : { 'cterm' : get( s:overrides, 'cyan',       '158' ) },
        \ 'darkblack'  : { 'cterm' : get( s:overrides, 'darkblack',  '232' ) },
        \ 'darkgray'   : { 'cterm' : get( s:overrides, 'darkgray',   '235' ) },
        \ 'diffadd'    : { 'cterm' : get( s:overrides, 'diffadd',    '58'  ) },
        \ 'diffchange' : { 'cterm' : get( s:overrides, 'diffchange', '60'  ) },
        \ 'diffdel'    : { 'cterm' : get( s:overrides, 'diffdel',    '238' ) },
        \ 'gray'       : { 'cterm' : get( s:overrides, 'gray',       '59'  ) },
        \ 'green'      : { 'cterm' : get( s:overrides, 'green',      '148' ) },
        \ 'lightgray'  : { 'cterm' : get( s:overrides, 'lightgray',  '245' ) },
        \ 'orange'     : { 'cterm' : get( s:overrides, 'orange',     '208' ) },
        \ 'purple'     : { 'cterm' : get( s:overrides, 'purple',     '141' ) },
        \ 'red'        : { 'cterm' : get( s:overrides, 'red',        '197' ) },
        \ 'white'      : { 'cterm' : get( s:overrides, 'white',      '255' ) },
        \ 'yellow'     : { 'cterm' : get( s:overrides, 'yellow',     '186' ) },
    \ }
endfunction
