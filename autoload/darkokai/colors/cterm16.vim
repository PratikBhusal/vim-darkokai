function! darkokai#colors#cterm16#get_colors() abort
    let s:overrides = darkokai#utils#colors#get_cterm_overrides()

    return {
        \ 'black'      : { 'cterm' : get( s:overrides, 'black',      '0'  ) },
        \ 'blue'       : { 'cterm' : get( s:overrides, 'blue',       '12' ) },
        \ 'brown'      : { 'cterm' : get( s:overrides, 'brown',      '3'  ) },
        \ 'cyan'       : { 'cterm' : get( s:overrides, 'cyan',       '14' ) },
        \ 'darkblack'  : { 'cterm' : get( s:overrides, 'darkblack',  '0'  ) },
        \ 'darkgray'   : { 'cterm' : get( s:overrides, 'darkgray',   '8'  ) },
        \ 'diffadd'    : { 'cterm' : get( s:overrides, 'diffadd',    '2'  ) },
        \ 'diffchange' : { 'cterm' : get( s:overrides, 'diffchange', '7'  ) },
        \ 'diffdel'    : { 'cterm' : get( s:overrides, 'diffdel',    '1'  ) },
        \ 'gray'       : { 'cterm' : get( s:overrides, 'gray',       '3'  ) },
        \ 'green'      : { 'cterm' : get( s:overrides, 'green',      '10' ) },
        \ 'lightgray'  : { 'cterm' : get( s:overrides, 'lightgray',  '7'  ) },
        \ 'orange'     : { 'cterm' : get( s:overrides, 'orange',     '1'  ) },
        \ 'purple'     : { 'cterm' : get( s:overrides, 'purple',     '13' ) },
        \ 'red'        : { 'cterm' : get( s:overrides, 'red',        '9'  ) },
        \ 'white'      : { 'cterm' : get( s:overrides, 'white',      '15' ) },
        \ 'yellow'     : { 'cterm' : get( s:overrides, 'yellow',     '11' ) },
    \ }
endfunction
