set nocompatible              " be iMproved, required
filetype off                  " required

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'junegunn/fzf'
Plug 'jlanzarotta/bufexplorer'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/autosession.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'lifepillar/vim-solarized8'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-vdebug/vdebug'
Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'php'}
"Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
"Plug 'prettier/vim-prettier'
call plug#end()

" set character encoding
set encoding=utf-8

" syntax highlighting
syntax on
syntax sync minlines=200
set synmaxcol=200
set redrawtime=10000 "https://github.com/vim/vim/issues/2790

" show a vertical guide at column 150 to avoid long lines of code
set colorcolumn=150

" disable cursorline (slow as shit)
set nocursorline

" solarized settings
set termguicolors
set background=dark
colorscheme solarized8

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
set pastetoggle=<f5>

" nvim, disable terminal timeout (when pressing esc)
set nottimeout

" gvim settings
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" F12 - reload syntax highligting
"noremap <F12> <Esc>:syntax sync fromstart<CR>
"inoremap <F12> <C-o>:syntax sync fromstart<CR>

" gutentags plugin
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

" ncm2 plugin
augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" ultisnips plugin
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" PHP7
let g:ultisnips_php_scalar_types = 1

" airline status line plugin
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ale syntax checker/highlighter plugin
" disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
" disable listing of errors at the bottom (default was 5)
let g:ale_list_window_size = 0
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier'],
  \ 'scss': ['prettier'],
  \}
let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" vdebug
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["path_maps"] = {
    \ "/home/vagrant/admin.directmail.io": "/home/dave/Projects/directmail.io/admin.directmail.io",
    \ "/home/vagrant/util.directmail.io": "/home/dave/Projects/directmail.io/util.directmail.io",
    \ "/home/vagrant/internal.directmail.io": "/home/dave/Projects/directmail.io/internal.directmail.io",
    \ "/home/vagrant/landing-page.directmail.io": "/home/dave/Projects/directmail.io/landing-page.directmail.io",
    \ "/home/vagrant/api.directmail.io": "/home/dave/Projects/directmail.io/api.directmail.io",
\}
let g:vdebug_options["server"] = ''


" phpactor plugin: context-aware menu with all functions (ALT-m)
nnoremap <m-m> :call phpactor#ContextMenu()<cr>
nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>
let g:phpactor_executable = '~/.vim/plugged/phpactor/bin/phpactor'


" fzf fuzzy finder customizations (make it behave like ctrlp)
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" prettier (prettier is run via stylelint for css,less,scss files)
"let g:prettier#autoformat = 0
"let g:prettier#autoformat_config_present = 0
"autocmd BufWritePre *.php,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.graphql,*.md,*.vue PrettierAsync

" vim-javascript
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

" bufexplorer
let g:bufExplorerSortBy='fullpath'   " sort by full file path name
cabbrev ls :BufExplorer
