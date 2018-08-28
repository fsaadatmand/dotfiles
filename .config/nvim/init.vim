" vim:ts=8

" default options
set backspace=indent,eol,start
set title
set ruler
set hidden
set incsearch
set modelines=5
set ignorecase
set scrolloff=10
set shiftwidth=4
set showcmd
set showmatch
set noshowmode
set smartcase
set splitbelow
set splitright
set tabstop=4
"set wildmode=longest,list,full
"set wildmenu
set nofoldenable
set cursorline
set termguicolors
set inccommand=nosplit
syntax on
filetype plugin indent on

" nord theme settings
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 12
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

" hexhighlight
nmap <F2>           <Plug>ToggleHexHighlight
nmap <leader><F2>   <Plug>ToggleSchemeHighlight

" pyton providor
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.7'

" ycm semantic completion:
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

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

" smooth_scroll maps
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" System & xterm clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" NERDTree Options:
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
