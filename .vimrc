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


"#########syntax###########
syntax on
filetype on "figure out filetype
filetype plugin on
filetype indent on

"#####others set#######
colorscheme desert
set mouse=a
let g:syntastic_c_include_dirs = ['/usr/lib/openmpi/include/']
let g:tex_conceal='' "invalidate the conceal of tex
set backspace=2 "enable delete \n by backspace
set bs=start "enable backspace in insert mode
set clipboard=unnamed,autoselect 
set cursorline	"high light line where focus is	 
set nf="" "not take number for 8 or 16 shinsu.
set nocompatible "enable plugin netrw
set noswapfile "don't make a swap file
set path+=/usr/lib/openmpi/include/
set suffixesadd+=.rc "in command"gf", "suffixesadd" is added to the end of file name
set wildmenu wildmode=list:longest	"show all selection when tab pushed
set wildmode=list "make The Completion Mode listupmode
set hidden "enable open a buffer with another buffer not saved

augroup cpp-path
    autocmd!
	autocmd FileType cpp setlocal path+=/usr/include/c++/4.8
augroup END
autocmd FileType cpp set dictionary=$HOME/.vim/dictionary/cpp.dict
autocmd FileType c set dictionary=$HOME/.vim/dictionary/c.dict
autocmd FileType sh hi Comment ctermfg=red
autocmd FileType python set expandtab	

"##########dein##########
if &compatible
	set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if has('vim_starting')
	call dein#begin(expand('~/.vim/dein'))

	call dein#add('Shougo/dein.vim')

	" My Bundles here:
	call dein#add('kien/ctrlp.vim')
	call dein#add('flazz/vim-colorschemes')
	call dein#add('thinca/vim-quickrun')

	call dein#add('Shougo/neosnippet')
	call dein#add('Shougo/neocomplete')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('yegappan/mru')
	call dein#add('vin-scripts/grep.vim' )
	call dein#add('scrooloose/syntastic' )
	call dein#add('junegunn/vim-easy-align' )
	call dein#add('tpope/vim-fugitive')
	call dein#add('rking/ag.vim')
	"Search in the Online English Dictionary
	call dein#add('thinca/vim-ref')
	"English <-> English Dictionary
	call dein#add('mfumi/ref-dicts-en')
	"alternative command
	call dein#add('tyru/vim-altercmd')

	call dein#add('vin-scripts/The-NERD-tree')
	call dein#add('vin-scripts/taglist.vim')
	call dein#add('https://github.com/wesleyche/SrcExpl.git')
	call dein#add('https://github.com/wesleyche/Trinity.git')

	call dein#end()
endif

"############# English Dictionary ###############"
"Definition of Dictionary
let g:ref_source_webdict_sites = {
			\   'je': {
			\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
			\   },
			\   'ej': {
			\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
			\   },
			\	'ee': {
			\	  'url' : 'http://www.oxforddictionaries.com/definition/english/%s',
			\	}
			\ }

"default web
let g:ref_source_webdict_sites.default = 'ej'

"filter for the output
"delete the first several rows
function! g:ref_source_webdict_sites.je.filter(output)
	return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
	return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ee.filter(output)
	return join(split(a:output, "\n")[150 :], "\n")
endfunction

call altercmd#load()
CAlterCommand ej Ref webdict ej
CAlterCommand je Ref webdict je
CAlterCommand ee Ref webdict ee

"############# neocomplete ###############"
let g:neocomplete#enable_at_startup=1
let g:neocomplete#auto_completion_start_length=3
let g:neocomplete#enable_fuzzy_completion=0


"############# neosnippet ################"
" Plugin key-mappings.
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

"############# vim-easy-align ################"
"Start interactve EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
"Start interactve EasyAlign for a motion/txt object
nmap <Leader>a <Plug>(EasyAlign)
nmap <C-]> g<C-]>

filetype on
