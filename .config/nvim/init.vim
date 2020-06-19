" vim:foldmethod=marker
set nocompatible

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Colors {{{
Plug 'altercation/vim-colors-solarized'
" }}}

" Fuzzy File Search {{{
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" }}}

" Language and Syntax {{{
Plug 'dense-analysis/ale'
" }}}

" Autocomplete / Snippets {{{
Plug 'neoclide/coc.nvim', {
      \ 'do': 'yarn install --frozen-lockfile'
\}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" pimp my vim {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
" }}}

" File Browser {{{
Plug 'preservim/nerdtree'
" }}}

" Utilities {{{
" Plug 'godlygeek/tabular'
" }}}

" Markdown {{{
Plug 'iamcco/markdown-preview.nvim', { 
      \ 'do': 'cd app & yarn install'
      \}
Plug 'masukomi/vim-markdown-folding'
" }}}

" Ledger {{{
" Plug('ledger/vim-ledger')
" }}}

call plug#end()
" }}}

" Init {{{
let did_install_default_menus = 1
let did_install_syntax_menu = 1
" }}}

" GUI {{{
set encoding=UTF-8

syntax enable

set clipboard=unnamedplus

set backspace=indent,eol,start
set hidden
set tabstop=2
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set pastetoggle=<F9>
set ignorecase
set smartcase
set hlsearch
set incsearch

" Conceal {{{
set conceallevel=0
set concealcursor=nc
let g:vim_markdown_conceal=2
" }}}

" Disable backup files {{{
set nobackup
set noswapfile
set wildignore=*.swp,*.bak
" }}}

" History {{{
set history=1000
set undolevels=1000
" }}}

set title
set laststatus=2
set noshowmode

set guifont=FuraCode\ Nerd\ Font

set number " show line numbers
set relativenumber
set scrolloff=999 " Keep cursor centered
set wrap " enable soft wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0 " prevent newlines when wrapping
set wrapmargin=0 " prevent newlines when wrapping
" }}}

" mappings {{{
let mapleader=","

" vim-plug commands {{{
nmap <silent> <leader>pu :PlugUpdate<CR>
nmap <silent> <leader>pi :PlugInstall<CR>
" }}}

" Colemak {{{
noremap K J
noremap J K

noremap h k
noremap j h
noremap k j
" }}}

" Disable Arrows {{{
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
" }}}

" Manage vimrc {{{
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" Easy split navigation {{{
" http://vimbits.com/bits/10
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" Select All {{{
" http://vimbits.com/bits/82
map <Leader>a ggVG
" }}}

" Keep search pattern at the center of the screen. {{{
" vimbits.com/bits/92
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
" }}}

" Reselect visual block after indent/outdent {{{
" http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv
" }}}

" Toggle the cursorline highlighting {{{
nnoremap <Leader>c :set cursorline!<CR>
" }}}

" Stop highlighting search terms {{{
noremap <silent><Leader>/ :nohls<CR>
" }}}

" For when my fingers don't work {{{
noremap <F1> <Esc>
" }}}

" So I don't have to press shift to run a command {{{
nnoremap ; :
" }}}

" code folding {{{
nmap <silent> + za
" }}}

" Jump to Errors {{{
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
" }}}

" Jump through the quick fix list {{{
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
" }}}

" NERDTree {{{
map <leader>n :NERDTreeToggle<CR>
" }}}

" Clap {{{
nnoremap <C-p> :Clap files ++finder=fd --type f --exclude node_modules .<CR>
" }}}

" }}}

" Colors {{{
set background=dark

colorscheme solarized

" Lightline {{{

let g:lightline = {
  \ "component_function": {
    \ "filetype": "MyFiletype",
    \ "fileformat": "MyFileformat",
  \ },
  \ "colorscheme": "solarized",
  \ "mode_map": {
    \ "n" : "N",
    \ "i" : "I",
    \ "R" : "R",
    \ "v" : "V",
    \ "V" : "VL",
    \ "\<C-v>": "VB",
    \ "c" : "C",
    \ "s" : "S",
    \ "S" : "SL",
    \ "\<C-s>": "SB",
    \ "t": "T",
  \ },
  \ "separator": {
    \ "left": "",
    \ "right": ""
  \   }
\}

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" }}}
" }}}

" Snippets {{{
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']
" }}}

" Markdown Preview {{{
let g:mkdp_preview_options = {
\   'uml': {
\     'server': 'http://localhost:8080',
\     'imageFormat': 'svg'
\   }
\ }
" }}}
