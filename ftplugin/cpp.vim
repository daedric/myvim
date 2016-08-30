nmap <buffer> <M-f> "zyiw:call daedric#myvim#Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


let s:clangformat_path=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-format.py'
let s:clangrename_path=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-rename.py'
let s:clangincludefixer_path=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/clang-include-fixer.py'
let s:clangupdatesyms_path=fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../clang/run-find-all-symbols.py'

function! s:FormatMe()
    exe 'py3file '. fnameescape(s:clangformat_path)
endfunction

function! s:FixInclude()
    exe 'py3file '. fnameescape(s:clangincludefixer_path)
endfunction

function! s:ClRename()
    exe 'py3file '. fnameescape(s:clangrename_path)
endfunction

function! s:UpdateSymbols()
    exe '!'. fnameescape(s:clangupdatesyms_path)
endfunction

"noremap <C-K> :pyf <SID>clangformat_path <CR>
map  <buffer> <c-f> :call <SID>FormatMe()<CR>
imap <buffer> <c-f> <ESC>:call <SID>FormatMe()<CR>i

map  <buffer> <leader>ci :call <SID>FixInclude()<CR>
map  <buffer> <leader>cr :call <SID>ClRename()<CR>
map  <buffer> <leader>cu :call <SID>UpdateSymbols()<CR>

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
