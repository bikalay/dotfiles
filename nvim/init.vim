call plug#begin()

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
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	nnoremap <C-l> :Prettier<cr>

	"Undo tree
		Plug 'mbbill/undotree'
	nnoremap <C-z> :UndotreeToggle<CR>

	if has("persistent_undo")
		let target_path = expand('~/.undodir')
		" create the directory and any parent directories
		" if the location does not exist.
		if !isdirectory(target_path)
		    call mkdir(target_path, "p", 0700)
		endif
		let &undodir=target_path
		set undofile
	 endif
	
	"Auto pairs
	Plug 'jiangmiao/auto-pairs'

	"Comments
	Plug 'tpope/vim-commentary'

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

		inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

	Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
	Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
	Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
	Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
	Plug 'ruanyl/coc-coverage', {'do': 'yarn install --frozen-lockfile'}
	Plug 'klaaspieter/coc-sourcekit', {'do': 'yarn install --frozen-lockfile'}
	autocmd FileType scss setl iskeyword+=@-@ 

	"Syntax highlight
	Plug 'sheerun/vim-polyglot'

	"Colors highlight
	Plug 'ap/vim-css-color'

	"JSDocs
	Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
	\}

	"Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'	
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	nnoremap <C-p> <cmd>Telescope find_files<cr>
	nnoremap <C-f> <cmd>Telescope live_grep<cr>

	"Svelte
	Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

:set relativenumber
:set number
:set number relativenumber
:set nowrap
:set noswapfile
:set smartcase
:set colorcolumn=80
:set nowritebackup
:set spell

colorscheme gruvbox-material
set background=dark

"Folding
:set foldmethod=syntax
:set nofoldenable
:set foldlevel=99

"Yaml
augroup filetype_yaml
    autocmd!
    autocmd BufNewFile,BufReadPost *.{yaml,yml},.kube/config set filetype=yaml foldmethod=indent
augroup END

au BufNewFile,BufRead,BufReadPost .kube/config set syntax=YAML

"Netrw
let g:netrw_banner    = 0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 50
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

:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-[> <C-\><C-n>
