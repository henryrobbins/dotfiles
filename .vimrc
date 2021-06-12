" Henry Robbins 2020

"Line numbering
set number
set relativenumber
set numberwidth=3
set textwidth=79
set autoindent

"Folding
set foldmethod=indent
set foldnestmax=1
nnoremap <space> za
vnoremap <space> zf

"Colors
set termguicolors
set bg=dark
colorscheme vscode
syntax on

"Auto-complete braces and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap <<space> <<space>
inoremap {<CR> {<CR>}<Esc>O<Tab>

"Tab by file type
au Filetype python setlocal tabstop=4 expandtab
au Filetype python setlocal shiftwidth=4 "for folding 
au Filetype vim setlocal tabstop=2 expandtab
au Filetype vim setlocal shiftwidth=2 "for folding

"Movement in insert and command line mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"File tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3 "tree structure
let g:netrw_browse_split = 3 "open in new tab
let g:netrw_winsize = 20 "border width

"If file tree not open, open; otherwise, close.
function TreeMap()
  if bufwinnr('NetrwTreeListing') == -1
    :Vexplore 
  else
    :exe 'bd '.join([bufnr('NetrwTreeListing')])
  endif 
endfunction
noremap <C-t> :call TreeMap() <CR>

"If no file on open, default to file tree
function VimEnter()
  if argc() == 0
    :Vexplore
    bd 1
  endif
endfunction
au VimEnter * nested call VimEnter()

"Tabs
set guitablabel=\[%N\]\ %t\ %M 

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
