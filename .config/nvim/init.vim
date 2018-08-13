" vim:ts=8

" patyogen options:
execute pathogen#infect()

" default options
set backspace=indent,eol,start
set title
set ruler
set hidden
set incsearch
"set laststatus=2
set modelines=5
set ignorecase
set scrolloff=10
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set tabstop=4
set wildmode=longest,list,full
set wildmenu
set nofoldenable
set cursorline
set termguicolors

colorscheme base16-tomorrow-night
syntax on
filetype plugin indent on

" number toggle
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Shortcut to rapidly toggle `set list`" Shor 
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" unmap arrow keys
"no <down> ddp
"no <up> ddkP
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" System & xterm clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb

" lightline colorscheme configuration
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERDTree Options:
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
