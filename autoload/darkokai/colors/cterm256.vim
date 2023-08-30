function! darkokai#colors#cterm256#get_colors() abort
    let s:overrides = darkokai#utils#colors#get_cterm_overrides()

    " Special color derivations:
    "
    " `diffadd` - 22 derived from hsl(81.3,60.8%,20%) rather than
    " hsl(80.3,60.8%,20%)
    "
    " `diffdel` - 53 derived from hsl(338.7,60.8%,24%) rather than
    " hsl(338.7,60.8%,20%)
    return {
        \ 'black'      : { 'cterm' : get( s:overrides, 'black',      '234' ) },
        \ 'blue'       : { 'cterm' : get( s:overrides, 'blue',       '81'  ) },
        \ 'brown'      : { 'cterm' : get( s:overrides, 'brown',      '242' ) },
        \ 'cyan'       : { 'cterm' : get( s:overrides, 'cyan',       '158' ) },
        \ 'darkblack'  : { 'cterm' : get( s:overrides, 'darkblack',  '232' ) },
        \ 'darkgray'   : { 'cterm' : get( s:overrides, 'darkgray',   '235' ) },
        \ 'diffadd'    : { 'cterm' : get( s:overrides, 'diffadd',    '22'  ) },
        \ 'diffchange' : { 'cterm' : get( s:overrides, 'diffchange', '60'  ) },
        \ 'diffdel'    : { 'cterm' : get( s:overrides, 'diffdel',    '53'  ) },
        \ 'gray'       : { 'cterm' : get( s:overrides, 'gray',       '59'  ) },
        \ 'green'      : { 'cterm' : get( s:overrides, 'green',      '148' ) },
        \ 'lightgray'  : { 'cterm' : get( s:overrides, 'lightgray',  '245' ) },
        \ 'orange'     : { 'cterm' : get( s:overrides, 'orange',     '208' ) },
        \ 'purple'     : { 'cterm' : get( s:overrides, 'purple',     '141' ) },
        \ 'red'        : { 'cterm' : get( s:overrides, 'red',        '197' ) },
        \ 'white'      : { 'cterm' : get( s:overrides, 'white',      '255' ) },
        \ 'yellow'     : { 'cterm' : get( s:overrides, 'yellow',     '186' ) },
        \ 'dimgray'    : { 'cterm' : get( s:overrides, 'dimgray',    '236' ) },
    \ }
endfunction
