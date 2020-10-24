" vim: fdm=marker

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Colors {{{
Plug 'morhetz/gruvbox'
" }}}

" File Browser {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
" }}}

" Tim Pope {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" }}}

" Lightline {{{
Plug 'itchyny/lightline.vim'
" }}}

" IntelliSense {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

" Linting {{{
Plug 'dense-analysis/ale'
" }}}

" Snippets {{{
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" }}}

" Markdown {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'masukomi/vim-markdown-folding'
Plug 'reedes/vim-lexical', {'for': ['markdown']}
" }}}

" Ledger {{{
Plug 'ledger/vim-ledger'
" }}}

" Utilities {{{
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
" }}}

" APM {{{
Plug 'ThePrimeagen/vim-apm'
" }}}

call plug#end()
" }}}

" Look and Feel {{{
" Color Scheme {{{
colorscheme gruvbox
set background=dark
" }}}

" Indentation {{{
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
" }}}

set title
set number
set relativenumber
set guifont=FiraCode\ Nerd\ Font

syntax enable
" }}}

" Other Vim Configuration {{{

" Clipboard {{{
set clipboard=unnamedplus " MacOS
" }}}

" Wrapping {{{
set textwidth=80
" }}}

" Colemak {{{
noremap K J
noremap J K

noremap h k
noremap j h
noremap k j

nnoremap <C-W>h :wincmd k<CR>
nnoremap <C-W>j :wincmd h<CR>
nnoremap <C-W>k :wincmd j<CR>
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

" Search {{{
set incsearch
" }}}

" Keep the cursor centered {{{
set scrolloff=999
" }}}

" }}}

" Helpers {{{
let mapleader=","

" Manage vimvrc {{{
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" Select All {{{
" http://vimbits.com/bits/82
map <Leader>a ggVG
" }}}

" So I don't have to press shift to run a command {{{
nnoremap ; :
" }}}

" Stop highlighting search terms {{{
noremap <silent><Leader>/ :nohls<CR>
" }}}

" Toggle Relative Line Numbers {{{
map <leader>rn :set rnu!<cr>
" }}}
" }}}

" NERDTree {{{
map <leader>n :NERDTreeToggle<CR>
" }}}

" Lightline {{{

let g:lightline = {
  \ "component_function": {
    \ "filetype": "MyFiletype",
    \ "fileformat": "MyFileformat",
  \ },
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

" COC {{{
" Trigger Completion {{{
inoremap <silent><expr> <c-space> coc#refresh()
" }}}
" Show Documentation {{{
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}
" Highlighting {{{
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}
" }}}

" ALE  {{{
" Configuration {{{
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" }}}
" Linters {{{
let g:ale_linters = {}

let g:ale_linters.javascript = ['eslint']
let g:ale_linters.java = ['checkstyle']
" }}}
" Fixers {{{
let g:ale_fixers = {}

let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.json = ['jq']
let g:ale_fixers.markdown = ['remove_trailing_lines', 'trim_whitespace']

let g:ale_fixers.go = ['gofmt']
" }}}
" }}} 

" UltiSnips {{{
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']
let g:snips_author="Craig Gardner"
let g:snips_email="craig.gardner@cdk.com"
" }}}

" Markdown Preview {{{
let g:mkdp_preview_options = {
\   'uml': {
\     'imageFormat': 'png'
\   }
\ }
" }}}

" vim-lexical {{{
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/mthesaur.txt',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
" }}}
