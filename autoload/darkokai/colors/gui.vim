function! darkokai#colors#gui#get_colors()
    let s:overrides = darkokai#utils#colors#get_gui_overrides()

    return {
        \ 'black'    : { 'gui' : get( s:overrides, 'black',    '#1b1d1e' ) },
        \ 'blue'     : { 'gui' : get( s:overrides, 'blue',     '#66d9ef' ) },
        \ 'darkgray' : { 'gui' : get( s:overrides, 'darkgray', '#232526' ) },
        \ 'green'    : { 'gui' : get( s:overrides, 'green',    '#a6e22e' ) },
        \ 'orange'   : { 'gui' : get( s:overrides, 'orange',   '#fd9720' ) },
        \ 'purple'   : { 'gui' : get( s:overrides, 'purple',   '#ae81ff' ) },
        \ 'red'      : { 'gui' : get( s:overrides, 'red',      '#f92672' ) },
        \ 'white'    : { 'gui' : get( s:overrides, 'white',    '#f8f8f2' ) },
        \ 'yellow'   : { 'gui' : get( s:overrides, 'yellow',   '#e6db74' ) },
    \ }
endfunction
