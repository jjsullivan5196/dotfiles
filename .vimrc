if !has('nvim')
	" Get the defaults that most users want.
	source $VIMRUNTIME/defaults.vim
endif

" Config
"
" Platform
if has('win32')
	let vhome=$HOME . '/vimfiles'
	if has('nvim')
		let vhome=$HOME . '/AppData/Local/nvim'
	else
		let vhome=$HOME . '/.vimfiles'
	endif
else
	if has('nvim')
		let vhome=$HOME . '/.local/share/nvim'
	else
		let vhome=$HOME . '/.vim'
	endif
endif

" External Plugins
call plug#begin(g:vhome . '/plugged/')
    Plug 'tpope/vim-surround'
	" Rust
	Plug 'rust-lang/rust.vim'

	" Fish?
	Plug 'dag/vim-fish'

	" Typescript stuff
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
	" For async completion
	Plug 'Shougo/deoplete.nvim'
	" For Denite features
	Plug 'Shougo/denite.nvim'
call plug#end()

let g:deoplete#enable_at_startup = 1

" Relative lines
set relativenumber

set autoindent expandtab shiftwidth=4 tabstop=4

" Oldvim 
if !has('nvim')
	" When started as "evim", evim.vim will already have done these settings.
	if v:progname =~? "evim"
		finish
	endif

	if has("vms")
		set nobackup		" do not keep a backup file, use versions instead
	else
		set backup		" keep a backup file (restore to previous version)
		if has('persistent_undo')
			set undofile	" keep an undo file (undo changes after closing)
		endif
	endif

	if &t_Co > 2 || has("gui_running")
		" Switch on highlighting the last used search pattern.
		set hlsearch
	endif

	" Only do this part when compiled with support for autocommands.
	if has("autocmd")
		" Put these in an autocmd group, so that we can delete them easily.
		augroup vimrcEx
			au!
			" For all text files set 'textwidth' to 78 characters.
			autocmd FileType text setlocal textwidth=78
		augroup END
	else
		set autoindent		" always set autoindenting on
	endif " has("autocmd")

	" Add optional packages.
	"
	" The matchit plugin makes the % command work better, but it is not backwards
	" compatible.
	" The ! means the package won't be loaded right away but when plugins are
	" loaded during initialization.
	if has('syntax') && has('eval')
		packadd! matchit
	endif

	set backup
	let &backupdir=g:vhome . '/backup/'
	let &dir=g:vhome . '/swap/'
	let &undodir=g:vhome . '/undo/'

	syntax enable
	filetype plugin indent on

	set mouse-=a
	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=
endif
