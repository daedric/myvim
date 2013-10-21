nmap <buffer> <M-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let s:clangpath=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'

function! s:FormatMe()
    exe 'pyfile '. fnameescape(s:clangpath)
endfunction

"noremap <C-K> :pyf <SID>clangpath <CR>
map <c-f> :call <SID>FormatMe()<CR>
imap <c-f> <ESC>:call <SID>FormatMe()<CR>i

let c_source = [ 'cc', 'cxx', 'cpp', 'C']
let c_header = [ 'h', 'hh', 'hpp', 'hxx']

let b:current_file_ext = expand('%:e')


if index(c_source, b:current_file_ext) != -1
    let b:fswitchdst  = join(c_header, ',')
    let b:fswitchlocs = 'reg:/src/include/,ifrel:|/src/|../include|,./'
elseif index(c_header, b:current_file_ext) != -1
    let b:fswitchdst  = join(c_source, ',')
    let b:fswitchlocs = 'reg:/include/src/,ifrel:|/include/|../src|,./'
endif

if has("gui_running")
    nmap <C-s>   :FSHere<cr>
else
    nmap <C-@>   :FSHere<cr>
endif
