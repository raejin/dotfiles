call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate' "automatically adds closing brackets
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'maksimr/vim-jsbeautify'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Automatically create dir if not existed on write
set timeoutlen=1000 ttimeoutlen=0
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

autocmd FileType javascript set formatprg=prettier\ --stdin

" Fugitive GitHub convenient stuff
let g:fugitive_github_domains = ['github.com', 'git.musta.ch']

scriptencoding utf-8

"set nocompatible
"set hidden
"set showtabline=0
"FZF file fuzzy search stuff
"set rtp+=/usr/local/opt/fzf
" JavaScript syntax stuff

let b:javascript_fold=0
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:jsx_ext_required = 0

" Rae's setting from scratch
"colorscheme hybrid
colorscheme hybrid_reverse
set background=dark
syntax on
filetype plugin indent on          " filetype detection and settings
set backspace=indent,eol,start     " let the backspace key work "normally"
set incsearch                      " incremental search
set ruler                          " shows line number in the status line
set nu
set relativenumber
set nofoldenable    " disable folding " Airline config
set laststatus=2           " Airline status line to be always on
let g:airline_theme="wombat"
set hid
if has('mouse')
  set mouse=a
endif
set ignorecase
set hlsearch
set incsearch
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set foldcolumn=1
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
set gfn=Inconsolata-dz:h13.5

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guifont=Inconsolata-dz:h13
set guioptions-=R
set guioptions-=l
set guioptions-=L
" Tab and Spaces settings
set expandtab
set tabstop=2
set shiftwidth=2
set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
set autoread
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
map 0 ^
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""" => KEY BINDINGS RELATED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guicursor+=a:blinkon0
let mapleader = ","
let g:mapleader = ","

" Smart way to move between windows
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-h> <C-W>h
"nnoremap <C-l> <C-W>l
" Fast saving
nmap <leader>w :w!<cr>
nmap <C-d> viwy/<C-r>0<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
"let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
let NERDTreeIgnore = ['*node_modules*']

" Move line using <Ctrl-Shift-j/k>
nmap zj mz:m+<cr>`z
nmap zk mz:m-2<cr>`z
vmap zj :m'>+<cr>`<my`>mzgv`yo`z
vmap zk :m'<-2<cr>`>my`<mzgv`yo`z
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
map <leader>bd :bd<cr>
map <leader>bn :<cr>
map <leader>bp :bp<cr>
imap <C-g> <Esc>

map <C-t> :GFiles<CR>
map <leader>ff :call JsBeautify()<cr>
