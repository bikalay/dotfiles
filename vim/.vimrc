"Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
	call plug#begin('~/.vim/plugged')

	"Theme
	Plug 'gruvbox-community/gruvbox'
	Plug 'sainnhe/gruvbox-material'
	
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme = 'gruvbox_material'

	"Editorconfig 
	Plug 'editorconfig/editorconfig-vim'

	"Prettier
	Plug 'prettier/vim-prettier', {
  	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] 
  	\ }
	nmap <C-l> :Prettier<CR>

	"Undo tree
	Plug 'mbbill/undotree'
	set undodir=~/.vim/undodir
	set undofile
	nnoremap <C-z> :UndotreeToggle<CR>

	"Auto pairs
	Plug 'jiangmiao/auto-pairs'

	"Comments
	Plug 'tpope/vim-commentary'
	nmap <C-_> gcc
	nmap <C-?> gcap
	vmap <C-_> gc

	"Surround
	Plug 'tpope/vim-surround'

	"Emmet
	Plug 'mattn/emmet-vim'
	let g:user_emmet_leader_key='<C-m>'

	"Close Tag
	Plug 'alvan/vim-closetag'
	
	"Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

		"GoTo code navigation.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)

	Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

	"Search 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
	Plug 'junegunn/fzf.vim'

	if executable('rg')
    		let g:rg_derive_root='true'
	endif

	function! s:find_git_root()
  		return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
	endfunction

	command! ProjectFiles execute 'Files' s:find_git_root()

	noremap <C-P> :ProjectFiles<CR>
	noremap <C-F> :Rg<CR>
	
	"Float Terminal
	Plug 'voldikss/vim-floaterm'
	command FT FloatermNew

call plug#end()

colorscheme gruvbox-material
set background=dark

"Base settings
syntax on
set number
set nowrap
set noswapfile
set smartcase
set colorcolumn=80
set noerrorbells
set nowritebackup
set updatetime=300
set spell

"Netrw
let g:netrw_banner    = 0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 25
let g:netrw_preview   = 1
let g:netrw_altv      = 1

"Highlight Match patterns
highlight MatchParen ctermbg=blue guibg=lightblue

"Spells
hi clear SpellBad
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
hi SpellBad gui=undercurl guisp=red term=undercurl cterm=undercurl

"diff
command Diff w !git diff % -

