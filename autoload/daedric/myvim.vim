"From: https://gist.github.com/DelvarWorld/048616a2e3f5d1b5a9ad

function! daedric#myvim#Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction
