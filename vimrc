""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Plugin
"   github:  xxx/abc
"   vim-script:  abc
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
" python autocomplete
Plugin 'davidhalter/jedi-vim'
" source code trace
Plugin 'vim-scripts/taglist.vim.git'
Plugin 'aceofall/gtags.vim'
Plugin 'ronakg/quickr-cscope.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'chazy/cscope_maps'
" airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" show git info in airline
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set <LEADER>
let mapleader = "\<tab>"
"

" Syntax enable
syntax on
set synmaxcol=200

" Get out of VI's compatible mode
set nocompatible

" Cursor line
set cursorline
highlight CursorLine cterm=none ctermbg=234

" Folder
syn region myFold start="{" end="}" transparent fold
set foldenable
set foldmethod=syntax
set foldcolumn=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup directory
set backup
"  Where to put backup file
set backupdir=~/.vim/backup
" Directory for temp file
set directory=~/.vim/temp

set nowritebackup
set noswapfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim will change the current working directory whenever you
"         open a file, switch buffers, delete a buffer or open/close a window
" set autochdir

" Set line number
set nu

" 256 colors
set t_Co=256
colorscheme onedark

" Set tab
" Replace tab with space
set expandtab
" Set tab to 4 space
set tabstop=4
" To change the number of space characters inserted for indentation
set shiftwidth=4

" Start searching when you type the first character of the search string
set incsearch

" Sets how many lines of history VIM have to remember
set history=400

" Ignore case in searching
set ignorecase

" Show matching braces
set showmatch

" Set to auto read when a file is changed from the outside
set autoread

" Indent
set ai
set cindent

" Undo
set undodir=~/.vim/undo/
set undofile

" Set backspace
" set backspace=start,indent,eol
set backspace=start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Set magic on
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Session feature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" let g:session_dir="~/.vim/session"
"set sessionoptions-=buffers
"
"function! GET_SESSION_DIR()
"    if exists("g:session_dir")
"    " set session dir
"        let _sessdir_ = expand(g:session_dir)
"    else
"        let _sessdir_ = expand('$HOME/.vim/session')
"    endif
"    " mkdir if need
"    if !isdirectory(_sessdir_)
"        call mkdir(_sessdir_)
"    endif
"    return _sessdir_
"endfunction
"
"function! GET_SESSION_FILE()
"    return GET_SESSION_DIR() . "/" . system("pwd | md5 | perl -pe 'chomp'") . ".vim"
"endfunction
"
"function! SAVE_SESSION()
"    " save session to sessdir
"    silent execute "mksession! " . GET_SESSION_FILE()
"    silent execute '!echo colorscheme atom-dark >> ' . GET_SESSION_FILE()
"endfunction
"
"function! LOAD_SESSION()
"    let _path_ = GET_SESSION_FILE()
"    if filereadable(_path_)
"        execute "source " . _path_
"    endif
"endfunction
"
"autocmd BufWrite * call SAVE_SESSION()
"autocmd VimEnter * if argc() == 0 | call LOAD_SESSION() | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When editing a file, always jump to the last known cursor position.
" Don’t do it when the position is invalid or when inside an event handlen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute "normal g`\"" |
    \ endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("/usr/local/lib/python2.7/site-packages/androguard-1.5-py2.7.egg")
    autocmd FileType python python import sys ; sys.path.append("/usr/local/lib/python2.7/site-packages/androguard-1.5-py2.7.egg")
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto reload vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost *vimrc source %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent scratch window from omni complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,longest,preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set previewheight=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set filetype depend on the filename extension
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.ros set ft=php
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 啟動後是使用 utf-8 編碼
set encoding=utf-8
" 新開的檔案預設是 utf-8 編碼
set fileencoding=utf-8
" 所有可能的檔案編碼
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
" 設定輸出到 terminal 的編碼
set termencoding=utf-8
" 將 unicode 中不確定的字符表示成雙字符，在 unicode 下才有用
"set ambiwidth=double

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For tab configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show tab line
set showtabline=2
" Last used tab switching
autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction
nmap tt :call SwitchLastUsedTab()<CR>

" Fast tab moving
for i in range(0, 9)
    exe "nmap <ESC>" . i . " :tabnext " . (i + 1) . "<CR>"
endfor

set switchbuf=usetab

" Tab line format
function! TabLine()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let hiBG = ((i == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#')
        let winnr = tabpagewinnr(i, '$')
        "let filename = bufname(tabpagebuflist(i)[winnr - 1])
        let filename = bufname(tabpagebuflist(i)[0])
        if (filename == 'NERD_Tree_1')
            let filename = bufname(tabpagebuflist(i)[1])
        endif
        if (filename == '')
            let filename = '=No Name='
        endif
        let s .= hiBG . ' '
        if (winnr > 1)
            let s .= '[' . (i - 1). '-' . winnr . '] '
        else
            let s .= '[' . (i - 1) . '] '
        endif
        "let s .= substitute(filename, '.\+\/', '', 'g')
        let s .= filename
        let s .= (1 == gettabwinvar(i, 1, '&modified') ? '[+]' : '')
        let s .= ' '
        let i += 1
    exe | endfor
    let s .= '%#TabLineFill#'
    return s
endfunction
set tabline=%!TabLine()

if &term == "xterm-color" || &term == "xterm-16color"
    hi TabLine      cterm=NONE      ctermfg=grey      ctermbg=darkgrey
    hi TabLineFill  cterm=NONE      ctermfg=grey      ctermbg=darkgrey
    hi TabLineSel   cterm=NONE      ctermfg=grey      ctermbg=blue
else
    hi TabLine      cterm=NONE      ctermfg=white      ctermbg=darkgrey
    hi TabLineFill  cterm=NONE      ctermfg=white      ctermbg=darkgrey
    hi TabLineSel   cterm=NONE      ctermfg=white      ctermbg=0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-T>c :tabnew<CR>
nmap <C-T>k :tabclose<CR>
nmap <C-H> :tabprev <CR>
nmap <C-L> :tabnext<CR>
imap <C-A> <HOME>
imap <C-E> <END>
nmap <C-K> ddkP
nmap <C-J> ddp
nmap <LEADER>j o<ESC>
nmap <LEADER>k O<ESC>
nnoremap bf :bf<CR>


let s:uname = system("uname")
if s:uname == "Darwin\n"
    " Do Mac stuff here
    nmap <LEADER>p V:!pbpaste<CR>
    nmap <LEADER>y :.w !pbcopy<CR><CR>
    vmap <LEADER>y :w !pbcopy<CR><CR>
else
    nmap <LEADER>p :set paste!<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line number map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <LEADER>l :call ShowLineNumber()<CR>
function! ShowLineNumber()
    if(&nu == 1)
        set nu!
        set foldcolumn=0
        echo "Line number disable"
    else
        set nu!
        set foldcolumn=3
        echo "Line number enable"
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <LEADER>m :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function! ShowMouseMode()
    if (&mouse == 'a')
        echo "Mouse enable"
    else
        echo "Mouse disable"
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" encoding change hotkey
noremap <LEADER>b :e ++enc=big5<CR>:set tenc=big5<CR>:set fenc=big5<CR>

" NERD tree tab
noremap ,n :NERDTreeTabsToggle<CR>

"gundo
let g:gundo_right=1
nnoremap ,r :GundoToggle<CR>

" air line
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" set status line
set laststatus=2

" autopairs
let g:AutoPairsShortcutFastWrap = '<C-w>'

" gtags
set cscopetag " 使用 cscope 作为 tags 命令
"set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

let g:quickr_cscope_program = "gtags-cscope"
let g:quickr_cscope_db_file = "GTAGS"
let g:quickr_cscope_use_qf_g = 1

nmap <C-t> <C-^>

"let GtagsCscope_Auto_Load = 1
"let CtagsCscope_Auto_Map = 1
"let GtagsCscope_Quiet = 1

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
" native support
set list lcs=tab:⇢\ 

" The Vim documentation suggests adding set secure as the last line in your
" vimrc.
set secure
