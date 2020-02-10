function! darkokai#compatibility#execute#call(command) abort
    redir => l:command_output
        silent execute a:command
    redir END
    return l:command_output
endfunction
