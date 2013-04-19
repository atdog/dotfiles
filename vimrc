""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" Plugin
"   github:  xxx/abc
"   vim-script:  abc
Bundle "vim-scripts/AutoComplPop"
Bundle "sjl/gundo.vim.git"
Bundle "scrooloose/nerdtree.git"
Bundle "vim-scripts/simplecommenter.git"
Bundle "vim-scripts/taglist.vim.git"
Bundle "jeroenbourgois/vim-actionscript.git"
Bundle "Lokaltog/vim-powerline.git"
Bundle "sontek/rope-vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "vim-scripts/AnsiEsc.vim"
Bundle "vim-scripts/AnsiEsc.vim"
Bundle "jistr/vim-nerdtree-tabs"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" Set <LEADER>
let mapleader = ","

" Syntax enable
syntax on

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
set autochdir

" Set line number
set nu

" 256 colors
set t_Co=256
colorscheme atdog

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:session_dir="~/.vim/session"
set sessionoptions-=buffers 

function! GET_SESSION_DIR()
    if exists("g:session_dir")
    " set session dir
        let _sessdir_ = expand(g:session_dir)
    else
        let _sessdir_ = expand('$HOME/.vim/session')
    endif
    " mkdir if need
    if !isdirectory(_sessdir_)
        call mkdir(_sessdir_)
    endif
    return _sessdir_
endfunction

function! GET_SESSION_FILE() 
    return GET_SESSION_DIR() . "/" . system("pwd | md5 | perl -pe 'chomp'") . ".vim"
endfunction

function! SAVE_SESSION()
    " save session to sessdir
    silent execute "mksession! " . GET_SESSION_FILE()
endfunction
    silent execute '!echo colorscheme atdog >> ' . GET_SESSION_FILE()

function! LOAD_SESSION()
    let _path_ = GET_SESSION_FILE()
    if filereadable(_path_)
        execute "source " . _path_
    endif
endfunction

autocmd BufWrite * call SAVE_SESSION()
autocmd VimEnter * if argc() == 0 | call LOAD_SESSION() | endif
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
set ambiwidth=double

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
" Mac vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " set colors
    colors atdog
    set cursorline
    set guifont=Source\ Code\ Pro\ Light:h16

    " window size
    set lines=100
    set columns=90

    " hide tool bar
    set guioptions+=c
    set guioptions-=e
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    " disable input manager
    set imdisable
    set antialias

    if has("gui_macvim")
        " set CMD+ENTER fullscreen
        set fuopt=maxhorz,maxvert
        " for eclim <cmd + shift + L>
        "map <D-L> :ProjectList<CR>
        "map <D-C> :ProjectCreate
        "map <D-E> :ProjectTree<CR>
        "map <D-D> :ProjectDelete
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rope vim(Python AutoComplPop)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
imap <LEADER>a <C-R>=RopeCodeAssistInsertMode()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
    nmap <LEADER>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    imap <LEADER>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
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
noremap <LEADER>n :NERDTreeTabsToggle<CR>

"gundo
let g:gundo_right=1
nnoremap <LEADER>r :GundoToggle<CR>

" power line
let g:Powerline_symbols = 'fancy'
" set status line
set laststatus=2

" The Vim documentation suggests adding set secure as the last line in your
" vimrc.
set secure
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
