set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'junegunn/fzf'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/autosession.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'lifepillar/vim-solarized8'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'captbaritone/better-indent-support-for-php-with-html'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" set character encoding
set encoding=utf-8

" syntax highlighting
syntax on
syntax sync minlines=200
set synmaxcol=200

" show a vertical guide at column 150 to avoid long lines of code
set colorcolumn=150

" disable cursorline (slow as shit)
set nocursorline

" solarized settings
set termguicolors
colorscheme solarized8_dark

" don't select line numbers when highlighting text with the mouse
set mouse=a
" yank text to the system clipboard (ctrl-p to paste it anywhere)
set clipboard=unnamedplus

" highlighted search results
set hlsearch

" Use incremental searching
set incsearch

" Set standard setting for PEAR coding standards
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent
set cindent

" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically, set text-width to 0 also
set nowrap
set tw=0

" Show line numbers
set number

" Always show filename
set ls=2

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" allow switching buffers without saving first
set hidden

" no backups or swap files, evarrr!
set nobackup
set noswapfile

" allow backspacing over everything
set backspace=indent,eol,start

" show whitespaces,tabs,etc
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" show line wrap (continuation)
set showbreak=↪

" code folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99 " default to unfolded on file open

" toggle paste/nopaste
:set pastetoggle=<f5>

" gvim settings
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" F12 - reload syntax highligting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" JSX syntax highlighting in non-jsx files
let g:jsx_ext_required = 0

" airline status line plugin
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
" always show statusline
set laststatus=2

" fzf fuzzy finder customizations (make it behave like ctrlp)
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" delimitMate brace completion
" let g:delimitMate_expand_cr = 1

" ctrlp fuzzy finder file browser
"if executable('ag')
  " use ag over grep for searching files
  " set grepprg=ag\ --nogroup\ --nocolor
"  let g:ctrlp_user_command = 'ag %s -l --path-to-agignore ~/.agignore --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
"set runtimepath^=~/.vim/bundle/ctrlp.vim
" these two directives don't work with g:ctrlp_user_command, they are in ~/.agignore instead
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tgz,*.idx,*.pack,*/vendor/*,*/\.git/*
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)|tour$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" vim-javascript
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

" bufexplorer
let g:bufExplorerSortBy='fullpath'   " sort by full file path name
cabbrev ls :BufExplorer

