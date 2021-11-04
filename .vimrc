"--------------------------------------------------
"Basic Settings
"--------------------------------------------------
packloadall
set nocompatible
let mapleader=" "
let maplocalleader=" "

filetype plugin on
syntax on
set number
set noerrorbells
set belloff=all
set expandtab
set smartindent
set smartcase
set incsearch
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
set conceallevel=2
set tabstop=2 softtabstop=2
set shiftwidth=2
set wrap linebreak nolist
set background=dark
set clipboard=unnamedplus
set complete+=kspell
set list lcs=tab:\|\

"---------Prettier Config

" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 'auto'

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 'auto'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

" Define the flavor of line endings
" lf|crlf|cr|all
" defaut: 'lf'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')
let g:prettier#config#single_quote = 'true'


"--------- CoC Config
let g:coc_global_extensions = ['coc-snippets', 'coc-json', 'coc-git', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-prettier', 'coc-solargraph', 'coc-emmet']

"--------- Yggdroot Config
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"--------- Emmet Config
let g:user_emmet_leader_key=','
let g:user_emmet_settings= {
\  'html' : {
\    'block_all_childless' : 1,
\  },
\}

" ------------------------------------------------
"  PLUGINS
" ------------------------------------------------

call plug#begin('~/.vim/plugged')
"------------------ CoC
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

"------------------ Emmet
 Plug 'mattn/emmet-vim'

" ----------------- Linting
 Plug 'dense-analysis/ale'

"------------------- Prettier
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"------------------- Changes Plugin
 Plug 'chrisbra/changesPlugin'

"------------------- Commentary Plugin
 Plug 'tpope/vim-commentary'

"------------------- Endwise Plugin
Plug 'tpope/vim-endwise'

"------------------- LeaderF Plugin
 Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"------------------- Vim-snippets Plugin
Plug 'honza/vim-snippets'

" ----------------- Languages and file types.
 Plug 'chrisbra/csv.vim'
 Plug 'ekalinin/dockerfile.vim'
 Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
 Plug 'HerringtonDarkholme/yats.vim'
 Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
 Plug 'maxmellon/vim-jsx-pretty'
 Plug 'tpope/vim-rails'
 Plug 'vim-ruby/vim-ruby'
 Plug 'wgwoods/vim-systemd-syntax'
 Plug 'yuezk/vim-js'

" ----------------- vim-polyglot
 Plug 'sheerun/vim-polyglot'

"------------------- NERDTree
 Plug 'scrooloose/nerdtree'

 let g:NERDTreeAutoDeleteBuffer=1
 let g:NERDTreeQuitOnOpen=0
 let g:NERDTreeWinSize=40
 " Open nerd tree at the current file or close nerd tree if pressed again.
 nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

"--- Theme
 Plug 'morhetz/gruvbox'
 let g:gruvbox_contrast_dark = ('hard')
 " ---------------- Wakatime
 Plug 'wakatime/vim-wakatime'

call plug#end()

"-------------------  Color Scheme
colorscheme gruvbox

"-------------------------------------------------------------
"Basic Autocommands
"-------------------------------------------------------------
" NerdTree
autocmd VimEnter * NERDTree
autocmd FileType nerdtree set number
" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =
" Spell check
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html,*.ruby PrettierAsync
autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
