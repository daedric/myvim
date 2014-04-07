setl sw=2 sts=2 ts=2 et
nmap <buffer> <M-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x

let s:clangpath=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'
function! s:FormatMe()
    exe 'pyfile '. fnameescape(s:clangpath)
endfunction

map <c-f> :call <SID>FormatMe()<CR>
imap <c-f> <ESC>:call <SID>FormatMe()<CR>i
