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

" Syntax {{{
Plug 'sheerun/vim-polyglot'
" }}}

" Lightline {{{
Plug 'itchyny/lightline.vim'
" }}}

" Linting {{{
Plug 'dense-analysis/ale'
" }}}
" LSP {{{
Plug 'neovim/nvim-lspconfig'
" }}}

" Snippets {{{
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" }}}

" Markdown {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'masukomi/vim-markdown-folding'
Plug 'reedes/vim-lexical', {'for': ['markdown']}
Plug 'jkramer/vim-checkbox'
" }}}

" Ledger {{{
Plug 'ledger/vim-ledger'
" }}}

" Utilities {{{
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'

Plug 'nvim-lua/completion-nvim', { 'branch': 'master' }
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" }}}
" Godot {{{
Plug 'habamax/vim-godot'
Plug 'calviken/vim-gdscript3'
" }}}

" APM {{{
Plug 'ThePrimeagen/vim-apm'
" }}}
" External Plugins {{{
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }
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
set guifont=FiraCode\ Nerd\ Font\ Retina

syntax enable
" }}}
" Other Vim Configuration {{{
" Clipboard {{{
set clipboard=unnamedplus " MacOS
" }}}
" Wrapping {{{
set textwidth=120
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

nnoremap <C-F16> :m .+1<CR>==
nnoremap <C-_> :m .-2<CR>==
inoremap <C-F16> <Esc>:m .+1<CR>==gi
inoremap <C-_> <Esc>:m .-2<CR>==gi
vnoremap <C-F16> :m '>+1<CR>gv=gv
vnoremap <C-_> :m '<-2<CR>gv=gv
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
" Provider{{{
" let g:python3_host_prog = "/usr/local/bin/python3"
" }}}
" }}}
" FZF {{{
nnoremap <C-p> :Files<cr>
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

let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.json = ['jq']
let g:ale_fixers.markdown = ['remove_trailing_lines', 'trim_whitespace']

let g:ale_fixers.go = ['gofmt']
" }}}
" }}} 
" LSP {{{
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-K> <cmd>lua vim.lsp.buf.hover()<CR>

lua <<EOF
  local completion = require("completion")
  local lspconfig = require("lspconfig")
  lspconfig.tsserver.setup{on_attach=completion.on_attach}
  lspconfig.vimls.setup{on_attach=completion.on_attach}
  lspconfig.gopls.setup{on_attach=completion.on_attach}
  lspconfig.gdscript.setup{on_attach=completion.on_attach}
EOF
" }}}
" Completion {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_hover = 1

" }}}
" UltiSnips {{{
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']
let g:snips_author="Craig Gardner"
let g:snips_email="craig.gardner@cdk.com"
" }}}
" Markdown Preview {{{
let g:mkdp_preview_options = {
\   'uml': {
\     'imageFormat': 'png',
\     'server': 'http://localhost:8080'
\   }
\ }
" }}}
" vim-checkbox {{{
let g:checkbox_states = [' ', '-', 'x']
" }}}
" vim-lexical {{{
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/mthesaur.txt',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
" }}}
" Godot {{{
let g:godot_executable="/Applications/Godot.app/Contents/MacOS/Godot"
" }}}
" FireNVIM {{{
if exists('g:started_by_firenvim')
  set laststatus=0

  let g:firenvim_config = { 
      \ 'globalSettings': {
          \ 'alt': 'all',
          \ '<C-w>': 'noop',
          \ '<C-n>': 'default',
      \  },
      \ 'localSettings': {
          \ '.*': {
              \ 'cmdline': 'nvim',
              \ 'content': 'text',
              \ 'priority': 0,
              \ 'selector': 'textarea',
              \ 'takeover': 'always',
          \ },
      \ }
  \ }
  let fc = g:firenvim_config['localSettings']
  let fc['https?://confluence.cdk.com/*'] = {  
      \'takeover': 'once'
    \}
  let fc['https?://*.splunkcloud.com/*'] = {  
      \'takeover': 'once'
    \}
  let fc['https?://voice.google.com/*'] = {
      \'takeover': 'never'
    \}
  let fc['https?://127.0.0.1:?*'] = {
      \'takeover': 'never'
    \}
  let fc['https?://localhost:?*'] = {
      \'takeover': 'never'
    \}
endif
" }}}
" vim-tpipeline {{{
" tpipeline comes bundled with its own custom minimal statusline seen above
let g:tpipeline_statusline = '%!tpipeline#stl#line()'
" You can also use standard statusline syntax, see :help stl
let g:tpipeline_statusline = '%f'
" }}}
