"minpac mappings
command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus  packadd minpac | source $MYVIMRC | call minpac#status()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" minpac plugins
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('itchyny/lightline.vim')
call minpac#add('chriskempson/base16-vim')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('junegunn/fzf.vim')
call minpac#add('majutsushi/tagbar')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('kassio/neoterm')
cal minpac#add('ludovicchabant/vim-gutentags')
"call minpac#add('mtth/scratch.vim')
"call minpac#add('plasticboy/vim-markdown')
"call minpac#add('terryma/vim-smooth-scroll')

call minpac#add('k-takata/minpac', {'type':'opt'})
