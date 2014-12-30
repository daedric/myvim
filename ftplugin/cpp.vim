nmap <buffer> <M-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let s:clangpath=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'

function! s:FormatMe()
    exe 'pyfile '. fnameescape(s:clangpath)
endfunction

"noremap <C-K> :pyf <SID>clangpath <CR>
map  <buffer> <c-f> :call <SID>FormatMe()<CR>
imap <buffer> <c-f> <ESC>:call <SID>FormatMe()<CR>i

let c_source = [ 'cpp' , 'cc' , 'cxx' , 'C', 'ipp']
let c_header = [ 'hpp' , 'h'  , 'hh'  , 'hxx']

let b:current_file_ext = expand('%:e')

if index(c_source, b:current_file_ext) != -1
    let b:fswitchdst  = join(c_header, ',')
    let b:fswitchlocs = 'reg:/src/include/,ifrel:|/src/|../include|,./'
elseif index(c_header, b:current_file_ext) != -1
    let b:fswitchdst  = join(c_source, ',')
    let b:fswitchlocs = 'reg:/include/src/,ifrel:|/include/|../src|,./'
endif

if has("gui_running")
    nmap <buffer> <C-s>   :FSHere<cr>
else
    nmap <buffer> <Leader>s   :FSHere<cr>
endif
