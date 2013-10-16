nmap <buffer> <c-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let s:clangpath=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'

function! s:FormatMe()
    exe 'pyfile '. fnameescape(s:clangpath)
endfunction

"noremap <C-K> :pyf <SID>clangpath <CR>
map <C-K> :call <SID>FormatMe()<CR>
imap <C-K> <ESC>:call <SID>FormatMe()<CR>i
