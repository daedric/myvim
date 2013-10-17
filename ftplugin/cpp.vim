nmap <buffer> <c-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let s:clangpath=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'

function! s:FormatMe()
    exe 'pyfile '. fnameescape(s:clangpath)
endfunction

"noremap <C-K> :pyf <SID>clangpath <CR>
map <C-K> :call <SID>FormatMe()<CR>
imap <C-K> <ESC>:call <SID>FormatMe()<CR>i

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


nmap <silent> <C-I> :FSHere<cr>
nmap <silent> <C-L> :FSSplitRight<cr>
nmap <silent> <C-H> :FSSplitLeft<cr>
nmap <silent> <C-K> :FSSplitAbove<cr>
nmap <silent> <C-J> :FSSplitBelow<cr>
