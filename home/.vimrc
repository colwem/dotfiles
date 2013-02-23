set nocompatible 
filetype off

" setting up Vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'Tabular'
Bundle 'EasyMotion'
Bundle 'surround.vim'
Bundle 'The-NERD-Commenter'
Bundle 'flazz/vim-colorschemes'
Bundle 'CSApprox'
Bundle 'rails.vim'


filetype plugin indent on

" for powerline statusline
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim

" search is case insensitive unless I use a capital letter
set ignorecase
set smartcase
" search
set incsearch
set hlsearch

" formatting options
set smartindent
set autoindent
set tabstop=4 
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

syntax on
set nowrap
set scrolloff=4 " scrolls screen to give cursor an x line buffer

" make a map that will toggle hlsearch for one search
" make another map that will toggle hlsearch for good

colorscheme molokai
"set background=dark

if has('gui_running')
    "set guifont=-misc-fixed-medium-r-8--13-120-75-75-C-70-iso10646-1
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 8
    set guioptions-=tT " remove toolbar and tearaway menu
endif

au GuiEnter * set lines=48 columns=200 " x on english windows version

let mapleader = ","

" need to remap outerblock to o rather than a

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-m> <C-w>_<C-w>|
nnoremap <C-=> <C-w>=

nnoremap J o
nnoremap K O
nnoremap H I
nnoremap L A

"nnoremap e E
"nnoremap E e
"nnoremap w W
"nnoremap W w
"nnoremap b B
"nnoremap B b



" completion improvements 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" nnoremap <Leader>r !xrdb -merge % # for updating .Xresourses settings

set completeopt=longest,menuone,preview
set complete=.,b,u,]
set wildmode=longest,list:longest

if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
    \    if &omnifunc == "" | 
    \     setlocal omnifunc=syntaxcomplete#Complete | 
    \    endif 
    endif 

set laststatus=2
set noshowmode

" number and rnu for line numbers.  set up a map for this
set relativenumber

command W w !sudo tee % > /dev/null

" need to put it in a block that gets executed in an after event for Tabular
" AddTabularPattern afc /^[^:]*:\s*\zs 


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1


