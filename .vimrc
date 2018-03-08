" NOTE: tantatively turn filetype off.
"	(see :https://stackoverflow.com/questions/17630393/filetype-on-or-filetype-off)
filetype off
filetype plugin indent off

"######keymapping########
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"#######visual set######
set title	"show edit file name
set number  "show line number
set tabstop=4	"indent hava 4 spaces
set shiftwidth=4 "indent size on smartindent	
set smartindent "autoindent
set showcmd "show command been being typed

"######search set######
set ignorecase  "search ignoring Big/Small char
set smartcase	"if the search word contain Big char, nonIgnore
set hlsearch	"high light search
set incsearch	"serach on every time key pushed
set nowrapscan	"prohibit returning to the Top when the search reaches the end of the matching words.

"#####others set#######
colorscheme desert
set mouse=a "enable mouse for all mode
let g:tex_conceal='' "invalidate the conceal of tex
set backspace=2 "enable delete \n by backspace
set bs=start "enable backspace in insert mode
if has('nvim')
	set clipboard+=unnamedplus
else
	set clipboard=unnamed,autoselect 
endif
set cursorline	"high light line where focus is	 
set nf="" "not take number for 8 or 16 shinsu.
set nocompatible "enable plugin netrw
set noswapfile "don't make a swap file
set suffixesadd+=.rc "in command"gf", "suffixesadd" is added to the end of file name
set wildmenu wildmode=list:longest	"show all selection when tab pushed
set wildmode=list "make The Completion Mode listupmode
set hidden "enable open a buffer with another buffer not saved

" autocmd for some languages
augroup c-au
    autocmd!
	autocmd FileType cpp setlocal path+=/usr/include/c++/4.8
	autocmd FileType cpp set dictionary=$HOME/.vim/dictionary/cpp.dict
augroup END

augroup c-au
	autocmd!
	autocmd FileType c set dictionary=$HOME/.vim/dictionary/c.dict
augroup END

augroup sh-au
	autocmd!
	autocmd FileType sh hi Comment ctermfg=red
	autocmd BufNewFile *.sh put!='#!/bin/bash'
augroup END

augroup py-au
	autocmd!
	autocmd FileType python set expandtab	
	autocmd BufNewFile *.py put!='#!/usr/bin/env python3'
augroup END

"##########dein##########
if v:version < 704
	echo "update vim version to 7.4"
elseif !executable("git")
	echo "install git"
else
	let s:dein_home = expand("~/.vim/dein")
	let s:dein_repo_dir = s:dein_home . "/repos/github.com/Shougo/dein.vim"

	" If dein is not installed yet, install.
	if &runtimepath !~# '/dein.vim'
		if !isdirectory(s:dein_repo_dir)
			execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
		endif
		execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir , ':p')
	endif

	if and(dein#load_state(s:dein_home), has('vim_starting'))
		call dein#begin(s:dein_home, [expand('<sfile>:p')])

		" dein
		call dein#add('Shougo/dein.vim')

		call dein#add('flazz/vim-colorschemes')
		call dein#add('thinca/vim-quickrun') "run source code in the buffer and show output to a new window by :QuickRun

		" snippet
		call dein#add('Shougo/neosnippet')
		call dein#add('Shougo/neosnippet-snippets')

		" completion
		"TODO: configure deoplete if you got neovim or vim version 8.0 or above.
		if has('nvim')
			call dein#add('Shougo/deoplete.nvim')
		elseif v:version >= 800
			call dein#add('Shougo/deoplete.nvim')
			call dein#add('roxma/nvim-yarp')
			call dein#add('roxma/vim-hug-neovim-rpc')
		else 
			call dein#add('Shougo/neocomplete') "TODO: setup later
		endif

		call dein#add('yegappan/mru')
		call dein#add('scrooloose/syntastic') " check grammer error on editting
		call dein#add('junegunn/vim-easy-align') " easy and useful align feature
		call dein#add('tpope/vim-fugitive') " git wrapper for vim
		call dein#add('airblade/vim-gitgutter') " show mark that represents git diff
		call dein#add('jreybert/vimagit')
		call dein#add('rking/ag.vim')
		call dein#add('nathanaelkane/vim-indent-guides') " visualize depth of indent
		"call dein#add('tomasr/molokai') " new colorscheme
		

		" plugin to replace an Ex command with user defined Ex command
		call dein#add('tyru/vim-altercmd')

		" Trinity
		call dein#add('vim-scripts/The-NERD-tree')
		call dein#add('vim-scripts/taglist.vim')
		call dein#add('vim-scripts/SrcExpl')
		call dein#add('vim-scripts/Trinity')

		if (has('nvim') || v:version >= 800) && has("python3")
			call dein#add('Shougo/denite.nvim') 
		else
			call dein#add('Shougo/unite.vim') 
		endif

		call dein#add('vim-syntastic/syntastic')

		call dein#end()

		call dein#save_state()
	endif

	if dein#check_install()
		call dein#update()
	endif
endif

call altercmd#load()

"############# neocomplete ###############"
if dein#tap("neocomplete")
	let g:neocomplete#enable_at_startup=1
	let g:neocomplete#auto_completion_start_length=3
	let g:neocomplete#enable_fuzzy_completion=0
endif


"############# neosnippet ################"
" Plugin key-mappings.
if dein#tap("neosnippet")
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	"xmap <C-k>     <Plug>(neosnippet_expand_target)

	" SuperTab like snippets behavior.
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\: "\<TAB>"

	" For snippet_complete marker.
	if has('conceal')
		set conceallevel=2 concealcursor=i
	endif
endif

"############# vim-easy-align ################"
if dein#tap("vim-easy-align")
	"Start interactve EasyAlign in visual mode
	vmap <Enter> <Plug>(EasyAlign)
	"Start interactve EasyAlign for a motion/txt object
	nmap <Leader>a <Plug>(EasyAlign)
	nmap <C-]> g<C-]>
endif

"#########syntax###########
syntax on
filetype plugin indent on "figure out file type

"######### syntastic #########
let g:syntastic_python_checkers = ['pycodestyle', 'pyflakes']
let g:syntastic_python_pycodestyle_quiet_messages = {
	\ "regex":   '^E501 '
	\ }

set secure

function! IsSourcedScript(script)
	let s:sslist = ""
	redir => s:sslist
	silent! scriptnames
	redir END
	let s:ssslist = split(substitute(s:sslist, " \\+[0-9]\\+: \\+", "", "g"))
	let s:sssslist = map(s:ssslist, "expand(v:val)")
	if count(s:sssslist, a:script) != 0
		return 1
	else 
		return 0
	endif
endfunction


"###### status line ######
set statusline=(%n) "buffer number
set statusline+=%f "relative file path
set statusline+=%r "read only flag
set statusline+=%h "help buffer flag
set statusline+=%w "preview window flag
set statusline+=%= "right alignment
if dein#tap("vim-fugitive")
	set statusline+=%{fugitive#statusline()} "show git branch name
endif

set laststatus=2


"###### source local .vimrc ######
let s:cwd_vimrc = getcwd() . "/.vimrc"
if filereadable(s:cwd_vimrc) 
	if IsSourcedScript(s:cwd_vimrc) == 0
		exec "source " . s:cwd_vimrc
	endif
endif
