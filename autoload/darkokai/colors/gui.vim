function! darkokai#colors#gui#get_colors()
    let s:overrides = darkokai#utils#colors#get_gui_overrides()

    return {
        \ 'black'      : { 'gui' : get( s:overrides, 'black',      '#191919' ) },
        \ 'blue'       : { 'gui' : get( s:overrides, 'blue',       '#66d9ef' ) },
        \ 'brown'      : { 'gui' : get( s:overrides, 'brown',      '#75715e' ) },
        \ 'cyan'       : { 'gui' : get( s:overrides, 'cyan',       '#a1efe4' ) },
        \ 'darkblack'  : { 'gui' : get( s:overrides, 'darkblack',  '#080808' ) },
        \ 'darkgray'   : { 'gui' : get( s:overrides, 'darkgray',   '#232526' ) },
        \ 'diffadd'    : { 'gui' : get( s:overrides, 'diffadd',    '#415619' ) },
        \ 'diffchange' : { 'gui' : get( s:overrides, 'diffchange', '#5f5f87' ) },
        \ 'diffdel'    : { 'gui' : get( s:overrides, 'diffdel',    '#6f283d' ) },
        \ 'gray'       : { 'gui' : get( s:overrides, 'gray',       '#575b61' ) },
        \ 'green'      : { 'gui' : get( s:overrides, 'green',      '#a6e22e' ) },
        \ 'lightgray'  : { 'gui' : get( s:overrides, 'lightgray',  '#7E8E91' ) },
        \ 'orange'     : { 'gui' : get( s:overrides, 'orange',     '#fd9720' ) },
        \ 'purple'     : { 'gui' : get( s:overrides, 'purple',     '#ae81ff' ) },
        \ 'red'        : { 'gui' : get( s:overrides, 'red',        '#f92672' ) },
        \ 'white'      : { 'gui' : get( s:overrides, 'white',      '#f8f8f2' ) },
        \ 'yellow'     : { 'gui' : get( s:overrides, 'yellow',     '#e6db74' ) },
        \ 'dimgray'    : { 'gui' : get( s:overrides, 'dimgray',    '#323232' ) },
    \ }
endfunction
