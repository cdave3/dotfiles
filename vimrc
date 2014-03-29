" set terminal to 256 color mode
set t_Co=16

" set character encoding
set encoding=utf-8

" turn on syntax highlighting
syntax enable

" dark bg colorscheme
set background=dark
colorscheme solarized

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

" Do not wrap lines automatically
set nowrap

" Show line numbers by default
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

" remap jj to esc
:imap jj <Esc>

" allow backspacing over everything bitch
set backspace=indent,eol,start

" show whitespaces,tabs,etc
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" code folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99 " default to unfolded on file open

" airline status line plugin
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
" always show statusline
set laststatus=2

" delimitMate brace completion
let g:delimitMate_expand_cr = 1

" ctrlp fuzzy finder file browser
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tgz,*.idx,*.pack
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|tour$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
