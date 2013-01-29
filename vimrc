" turn off vi compatibility
set nocompatible

" Remove ALL autocommands for the current group.
autocmd!

" Setup Pathogen to load all bundles and their helptags
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" GUI only options
" (moved this to the top so that changes to colorscheme and so on can be made
" by plugins later on
if has('gui_running')
	colorscheme solarized
	set background=light
	" :set guioptions-=T  "remove toolbar
	" use powerline statusline and set patched Consolas font
	set encoding=utf-8
	" set guifont=Consolas\ for\ Powerline\ FixedD:h11
	set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
	let g:Powerline_symbols="fancy"
	" let g:Powerline_symbols="unix"
	set laststatus=2
else
	" colorscheme default
	set background=dark
endif

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers on :e instead of closing them
" set hidden

syntax enable on
filetype plugin indent on

" Show whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set modeline list listchars=tab:»·,trail:·,precedes:<,extends:>

if has('autocmd')
	" Use spaces for tabs in python
	autocmd filetype python set expandtab
	" Not sure what this does
	autocmd filetype html,xml set listchars=tab:>.
	" Don't remember what this does, it might be what starts where you were
	" last editing
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	autocmd VimLeave *.tex !rm *.aux *.log *.nav *.out *.snm *.toc
endif "autocmd

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.aux,*.out,*.o,*.lol,*.lot,*.log
set ruler			" Not sure what it does
set cursorline

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Toggle disable of auto-indent for pasting large code using F2
set pastetoggle=<F2>

" Enable mouse
if has('mouse')
	set mouse=a
endif

" Use ; instead of : for commands
" nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easier window navigation
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Turn spelling and off with ,se and ,sn
map <Leader>se :setlocal spell spelllang=en_gb<CR>
map <Leader>sh :setlocal spell spelllang=hu_hu<CR>
map <Leader>sd :setlocal spell spelllang=de_de<CR>
map <Leader>sn :setlocal nospell<CR>

" Clear search highlighting with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Convenient command to see the changes you've made (compares
" buffer to original file)
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Get sudo (only useful on Linux)
cmap w!! w !sudo tee % >/dev/null

"Options for LaTeX Suite
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_ViewRule_pdf = 'AcroRd32'

" Set automatic linebreaks for Wiki files
au! BufRead,BufNewFile *.wiki set tw=72

" Some vimwiki settings
let wiki = {}
let wiki.path = '~/Projects/Web/vimwiki'
let wiki.path_html = '~/Projects/Web/www/vimwiki'
let wiki.nested_syntaxes ={'bash': 'bash', 'java': 'java'}
let g:vimwiki_list = [wiki]
