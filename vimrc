set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
"Plugin 'chrisbra/histwin.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
"Plugin 'tell-k/vim-autopep8'
Plugin 'google/yapf'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-glaive'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'h-youhei/vim-ibus'

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

" command for you to re-install Vundle before do anything else
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

""""""""""""""""""""
" PLUGINS SETTINGS "
""""""""""""""""""""
" vim-ibus configuration
"let g:ibus#layout = 'xkb:us::eng'
"let g:ibus#engine = 'Bamboo'

" setup ale
" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0

" setup python-mode
"let g:pymode_options_max_line_length=120
" let g:pymode_run_bind='<C-S-F10>'
" disable autocomplete because I had Jedi
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope = 0
"let g:pymode_run = 0

" setup jedi-vim
" disable popup when autocomplete
"autocmd FileType python setlocal completeopt-=preview
" let Jedi work in Python3 VENV
"let g:jedi#force_py_version = 3
"set omnifunc=jedi#completions

" Auto Pairs
let g:AutoPairsShortcutToggle='<C-d>p'
let g:AutoPairsShortcutFastWrap='<C-d>e'
let g:AutoPairsShortcutJump='<C-d>n'

" configuration of gruvbox
set background=dark
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'

" configuration for vim-airline
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'molokai'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Configuration for Google Format Code
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

"""""""""""
" KEY MAP "
 """""""""""
" Toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Change leader key to ","
let mapleader = ","

" Press "jj" to ESC
imap jj <Esc>

" Move between split windows with a single shortcut (No need to press Ctrl+W
" first)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Run the current Python3 code
autocmd FileType python nnoremap <leader>sr :exec '!python3' shellescape(@%, 1)<CR>

" A quick way to change Keymap
imap <F5> :call ToggleKeymapTelex()<CR>

"""""""""""""""""
" OTHER SETTING "
"""""""""""""""""
" UI settings
set encoding=utf8
set number
set hidden
set mouse=a
set noshowmode
set noshowmatch
"set nolazyredraw
set pastetoggle=<F2>
set guifont=consolas\ 11
set nowrap
"set cursorline
"set clipboard=unnamedplus
set display=truncate
set history=200
set nolangremap
set langnoremap
set scrolloff=5
set showcmd
set wildmenu
set incsearch
set nrformats=bin,hex
syntax on
syntax enable
"colorscheme murphy
colorscheme gruvbox
" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" 1 tab == 4 spaces
autocmd FileType python set
  \ shiftwidth=4
  \ tabstop=4
  \ softtabstop=4
" highlighting pythonSelf
hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold


" I only remind me write code shorter :)
autocmd FileType python set colorcolumn=80

"""""""""""""""""""""""
" CUSTOMIZE FUNCTIONS "
"""""""""""""""""""""""

" Change keymap to vietnamese-telex
function! ToggleKeymapTelex()
    if &keymap== "vietnamese-telex"
        set keymap=
    else
        set keymap=vietnamese-telex
    endif
    echo "keymap =" &keymap
endfunction

" Clear all registers in case you need do that
function! ClearAllRegister()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction

