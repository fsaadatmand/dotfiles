" Try to load minpac.
packadd minpac

if !exists('g:loaded_minpac')
	" minpac is not available.

	" Settings for plugin-less environment.
else
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type':'opt'})

	" Additional plugins here.
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-surround')
	"call minpac#add('tpope/vim-vinegar')
	call minpac#add('scrooloose/nerdtree')
	call minpac#add('Xuyuanp/nerdtree-git-plugin')
	call minpac#add('itchyny/lightline.vim')
	"call minpac#add('chriskempson/base16-vim')
	call minpac#add('arcticicestudio/nord-vim')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('majutsushi/tagbar')
	call minpac#add('airblade/vim-gitgutter')
	call minpac#add('kassio/neoterm')
	call minpac#add('ludovicchabant/vim-gutentags')
	call minpac#add('SirVer/ultisnips')
	call minpac#add('honza/vim-snippets')
	call minpac#add('nvie/vim-flake8')
	call minpac#add('neomake/neomake')
	call minpac#add('sbdchd/neoformat')
	call minpac#add('ycm-core/YouCompleteMe')
	call minpac#add('ryanoasis/vim-devicons')
	"call minpac#add('octol/vim-cpp-enhanced-highlight')
	"call minpac#add('mtth/scratch.vim')
	"call minpac#add('plasticboy/vim-markdown')
	"call minpac#add('terryma/vim-smooth-scroll')
endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
