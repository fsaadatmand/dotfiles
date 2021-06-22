" vim:ts=8

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" minpac installed plugins
source ~/.config/nvim/packages.vim

"map vi ~/.config/nvm/init.vim
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" build and run shortcuts
let cflags = "-Wall -Wextra -Werror -pedantic-errors " 
let ccflags = "-Wall -Wextra -Werror -Weffc++ -pedantic-errors " 
autocmd filetype c nnoremap <F4> :w <bar> exec '!clang ' cflags .shellescape('%') ' && ./a.out' <CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clang++ ' ccflags .shellescape('%') ' && ./a.out' <CR>

" default options
set backspace=indent,eol,start
set title
"set ruler
set hidden
"set incsearch
set modelines=5
set ignorecase
set scrolloff=10
set shiftwidth=4
set noshowcmd
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
set shortmess=I
set termguicolors
set inccommand=nosplit
"set nohlsearch
set number relativenumber
"syntax on
"filetype plugin indent on

" true colours
" execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" nord theme settings
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

" FZF runtimepath
set rtp+=~/.fzf

" FZF keybindings
map <A-p> :Files ~/<CR>
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-h> :Helptags<CR>

" hide statusline when FZF is called
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Ycm semantic completion:
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py' " C config file
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt-=preview
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_trigger = 1
"let g:ycm_clangd_binary_path = '/usr/bin/clangd'  " A fix for annoing (std::) AttributeError
" let g:ycm_show_diagnostics_ui = 0 " use neomake instead

" Ycm python settings
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

" ycm :ForceCompileAndDiagnostic command map
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Neomake settings (linting)
"autocmd! BufWritePost,insertleave,BufEnter,TextChanged * Neomake
" autocmd! BufWinEnter,BufWritePost,insertleave,BufEnter,TextChanged * Neomake
" let g:neomake_python_enabled_makers = ['pylint', 'python']
"let g:neomake_cpp_enabled_makers = ['clangtidy']
"let g:neomake_cpp_clangtidy_maker = {
"   \ 'exe': '/usr/bin/clang-tidy',
"   \ 'args': ['-checks=*' ],
"   \}
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
    \ 'args': ['-std=c++17', '-Wall', '-Wextra', '-Weffc++', '-pedantic']
    \ }

" vim-cpp-enhanced-highlight
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1

" Trigger configuration. UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Shortcut to rapidly toggle `set list`
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

" Terminal (neoterm) mode settings
let g:neoterm_size = 5 
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1

autocmd BufEnter,Winenter * if &buftype == 'terminal' | :startinsert | endif

" open terminal in split window below
map <M-CR> :belowright Ttoggle<CR>
tnoremap <M-CR> <c-\><c-n> :belowright Ttoggle<CR>

" exit terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

" Switching windows
if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

" Tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 
let g:tagbar_compact = 1

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
" let g:lightline#bufferline#enable_devicons = 1

" NERDTree Options:
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
