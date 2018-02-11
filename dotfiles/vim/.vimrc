" From Solevis :


" completion
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"
" french spelling (:set spell)
setlocal spelllang=fr

" encoding
set fileencodings=utf-8,latin1,default
set encoding=utf-8

" open URL
command -bar -nargs=1 OpenURL :!exo-open --launch WebBrowser <args>

" colorize HTML into PHP code
let php_htmlInStrings=1

" :TOhtml
let use_xhtml=1
let html_use_css=1
let html_ignore_folding=1
let html_use_encoding="UTF-8"














" From Brice :


call plug#begin('~/.vim/plugged')

" Toggles between hybrid and absolute line numbers automatically :
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'

" A Filetype plugin for csv files
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'for': 'php' }

" Show a diff using Vim its sign column
Plug 'mhinz/vim-signify'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
Plug 'joonty/vdebug', { 'for': 'php' }

" An up-to-date Vim syntax for PHP (7.x supported)
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

" The official VIm indent script for PHP
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }

" Improved PHP omnicompletion
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()



syntax enable

" solarized from above plugin)
set background=dark
colorscheme solarized

" fonts
if has('macunix')
    set guifont=Monaco:h13
    set antialias
elseif has('unix')
    "set guifont=DejaVu\ Sans\ Mono\ 10
    set guifont=Hack\ 10
    set antialias
endif

" plugins
filetype on
filetype plugin on
filetype indent on

" wrap lines
set wrap

" relative number
set number relativenumber

" mouse : in all modes (Normal mode, Visual mode, Insert mode, Command-line mode)
set mouse=a

" no more vi compatibilty
set nocompatible

" lines number
set number
set numberwidth=3

" update terminal title
set title

" the last window will always have a status line
set laststatus=2

" 4 columns text is indented with the reindent operations
set shiftwidth=4
" hitting Tab in insert mode will produce the appropriate number of spaces
set expandtab

" matching parentheses
set showmatch

" search highlight
set hlsearch
" show the next match while entering a search
set incsearch
" ignore case but not if searching with an uppercase
set ignorecase
set smartcase

" show whitespace characters
set list

" highlight unwanted whitespace (replace spaces by custom characters)
set lcs:tab:»·,trail:·,nbsp:·

" no beeps
set visualbell
set noerrorbells

" file autocompletion : Complete till longest common string.  If this doesn't result in a longer string, use the next part. When more than one match, list all matches.
set wildmode=longest,list

" backup
set backup
set backupdir=~/.vim/backup/

" swap to recover work (.swp)
set swapfile

" persistent undo
set undofile
set undodir=~/.vim/undo/

" automatic indentation and detection
set autoindent
set smartindent

" php.vim plugin (see above) : colorize SQL into PHP code
let php_sql_query=1

" highlight current line
set cursorline
highlight CursorLine cterm=none ctermbg=grey

" highlight applied only in the current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" config for phpcomplete.vim plugin (see above)
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


" key mapping
" toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>
" svn diff
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
" tab creation like firefox
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
" tabs navigation
map <A-Right> gt
map <A-Left> gT
" , #perl # comments
map ,# :s/^/#/<CR>
" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>
" save as root
nnoremap <leader>r :w !sudo tee % > /dev/null<CR>
" phpfolding.vim config (see above plugin)
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>
" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
" Remap code completion to Ctrl+Space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-x><C-o>
else " no gui
  if has("unix")
    inoremap <Nul> <C-x><C-o>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif


" Syntastic (see above plugins)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" airline (see above plugin)
let g:airline#extensions#tabline#enabled = 1
" automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
set noshowmode
set cmdheight=1


" vdebug (see above plugin)
let g:vdebug_options = {'server': '127.0.0.1'}
let g:vdebug_options = {'port': '9001'}


" files associations
autocmd! BufRead,BufNewFile *.vpy,*.cpy,*.py,*.py_tmpl      set ft=python
autocmd! bufnewfile,bufread *.pt,*.cpt,*.kupu               set ft=zpt
autocmd! bufnewfile,bufread *.css,*.css.dtml                set ft=css
autocmd! bufnewfile,bufread *.js,*.js.dtml                  set ft=javascript
autocmd! BufNewFile,BufRead *.zcml,*.xml,*.pt,*zpt          set ft=xml
autocmd! bufnewfile,bufread *.php,*.phtml                   set ft=php
autocmd! BufNewFile,BufRead *.sql                           set ft=sql
autocmd! BufNewFile,BufRead *.cfg,*.cfg.dist                set ft=cfg
autocmd! BufRead,BufNewFile *.java                          set ft=java
autocmd! BufRead,BufNewFile *.sh                            set ft=sh
autocmd! BufNewFile,BufRead *.siv,*.sieve                   set ft=sieve
autocmd! BufNewFile,BufRead *.rst,*.txt,*.rest              set ft=rst
autocmd! BufNewFile,BufRead *.django                        set ft=django
autocmd! BufNewFile,BufRead *.pde                           set ft=c

" indentation
autocmd FileType cfg        set ts=4 sts=4 sw=4 et ai sta tw=0
autocmd FileType css        set ts=2 sts=2 sw=2 et ai sta tw=0
autocmd FileType javascript set ts=2 sts=2 sw=2 et ai sta tw=0
autocmd FileType java       set ts=4 sts=4 sw=4 et ai sta tw=0 
autocmd FileType php        set ts=4 sts=4 sw=4 et ai sta tw=0 
autocmd FileType python     set ts=4 sts=4 sw=4 et ai sta tw=0
autocmd FileType rst        set ts=4 sts=4 sw=4 et ai sta tw=0  syntax=rest
autocmd FileType sh         set ts=4 sts=4 sw=4 et ai sta tw=0 
autocmd FileType sieve      set ts=4 sts=4 sw=4 et ai sta tw=0
autocmd FileType sql        set ts=4 sts=4 sw=4 et ai sta tw=0 
autocmd FileType vim        set ts=4 sts=4 sw=4 et ai sta tw=0
autocmd FileType xml        set ts=2 sts=2 sw=2 et ai sta tw=0
autocmd FileType django     set ts=2 sts=2 sw=2 et ai sta tw=0
autocmd FileType zpt        set ts=2 sts=2 sw=2 et ai sta tw=220 syntax=zpt
autocmd FileType html       set ts=2 sts=2 sw=2 et ai sta tw=220
autocmd FileType htmldjango set ts=2 sts=2 sw=2 et ai sta tw=220


