""""""" VIMRC - vim config file """"""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make vim respects XDG especification
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after
set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after
let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')
set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')
set viminfofile=$XDG_CACHE_HOME/vim/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Call plugins with vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('/home/fabiosantos/.local/share/vim/plugged')
" Plug 'jalvesaq/Nvim-R'
" Plug 'vimwiki/vimwiki'
" call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-R
let R_rconsole_width = 0                        " Always prefer a horizontal split for R console
let R_rconsole_height = 18                      " Number of lines of R console

" VimWiki
let g:vimwiki_list = [{'path': '~/.local/share/vim/vimwiki'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General VIM Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape in diferent modes
let &t_SI = "\<esc>[6 q"
let &t_EI = "\<esc>[2 q"
if exists('&t_SR')
    let &t_SR = "\<esc>[4 q"
endif

set timeout timeoutlen=1000 ttimeoutlen=100

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" disable break lines automatically in .tex files
autocmd Filetype tex setlocal tw=0

" Toogle spellchecking
nnoremap <silent> <F11> :set spell!<cr>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Compile document, be it groff/LaTeX/markdown/etc.
map <F5> :w! \| !compiler "<c-r>%"<CR>

" Compile Rmd files in R
autocmd filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" Insert this in Rmd files
autocmd filetype rmd inoremap <leader>r ```{r<space>echo=TRUE}<CR>```<CR><CR><esc>2kO

" Open corresponding .pdf/.html or preview
map <F6> :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Cool file explorer stuff in a pane using netrw
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore .
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
nnoremap <silent> <C-n> :call ToggleVExplorer()<CR>

" netrw options
let g:netrw_sort_sequence = '[\/]$,*'   " directories first
let g:netrw_browse_split  = 4           " open new buffers in previous tab
let g:netrow_altv         = 1
let g:netrw_winsize       = -28         " thinner width
let g:netrw_banner        = 0           " hide the help info
let g:netrw_liststyle     = 3           " tree mode

" Set a Local Leader
let mapleader = ","
let g:mapleader = ","

" Buffers & Navigation
nmap <leader>T :enew<cr>                " To open a new empty buffer
nmap <leader>l :bnext<CR>               " Move to the next buffer
nmap <leader>h :bprevious<CR>           " Move to the previous buffer
nmap <leader>bq :bp <BAR> bd #<CR>      " Close the current buffer and move to the previous one
nmap <leader>bl :ls<CR>                 " Show all open buffers and their status

" Use wildmenu for navigate between buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <Tab> :b <C-Z>

" Tabs & Navigation
map <leader>nt :tabnew<cr>      " To create a new tab.
map <leader>to :tabonly<cr>     " To close all other tabs (show only the current tab).
map <leader>tc :tabclose<cr>    " To close the current tab.
map <leader>tm :tabmove<cr>     " To move the current tab to next position.
map <leader>tn :tabn<cr>        " To swtich to next tab.
map <leader>tp :tabp<cr>        " To switch to previous tab.

" Splits & Tabbed Files
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set display+=lastline           " Prevente vim show '@' if the line dont fit the screen
set showbreak=﬌                 " Character to show before the lines that have been soft-wrapped
set ma                          " To set mark a at current cursor location.
set number relativenumber       " To switch the line numbers on.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line when starting a new line.
set si                          " To switch on smart indentation.

" Search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.

" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.

" Errors
set noerrorbells                " No annoying sound on errors.

" Color & Fonts
syntax enable                   " Enable syntax highlighting.
language it_IT.UTF-8            " Use English as default
set encoding=utf8               " Set utf8 as standard encoding and 
set spelllang=en,pt             " Set standard languages.
set t_Co=256                    " Enable 256 colors palette"
set background=dark

" Files & Backup
set hidden                      " Allows buffers to be hidden
set nobackup                    " Turn off backup.
set nowb                        " Don't backup before overwriting a file.
set noswapfile                  " Don't create a swap file.
set ffs=unix,dos,mac            " Use Unix as the standard file type.

" Misc
set mouse=a                     " Enable mouse support    
" set ttymouse=sgr                " Fixes mouse scrolling in st
set clipboard=unnamedplus       " Vim clipboard buffer shared with the system clipboard
set wildmenu                    " Vim autocompetion menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8       ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7       ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0       ctermbg=8       cterm=none
highlight Statement        ctermfg=2       ctermbg=none    cterm=none
highlight Directory        ctermfg=4       ctermbg=none    cterm=none
highlight StatusLine       ctermfg=0       ctermbg=14      cterm=none
highlight StatusLineNC     ctermfg=14      ctermbg=0       cterm=none
highlight Comment          ctermfg=103     ctermbg=none    cterm=italic
highlight Constant         ctermfg=12      ctermbg=none    cterm=none
highlight Special          ctermfg=4       ctermbg=none    cterm=none
highlight Identifier       ctermfg=6       ctermbg=none    cterm=bold
highlight PreProc          ctermfg=5       ctermbg=none    cterm=none
highlight String           ctermfg=12      ctermbg=none    cterm=none
highlight Number           ctermfg=1       ctermbg=none    cterm=none
highlight Function         ctermfg=1       ctermbg=none    cterm=bold
highlight WildMenu         ctermfg=231     ctermbg=0       cterm=none
highlight Folded           ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none
highlight User1            ctermfg=14      ctermbg=0       cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                                                 " Always show statusline
set statusline=                                                  " Clear statusline
set statusline+=\ %{toupper(g:currentmode[mode()])}              " Show current mode
set statusline+=%<                                               " Truncate line here
set statusline+=%1*\                                            " Set highlight group to User1
set statusline+=%{&spell?'[SPELL]':''}                           " Show if spellchecking is active
set statusline+=\ %f                                             " Full path to the file in the buffer
set statusline+=%{&modified?'\ [+]':''}                          " Show if file is modified
set statusline+=%{&readonly?'\ []':''}                          " Show if file is readonly
set statusline+=%<                                               " Truncate line here
set statusline+=%=                                               " Separation point between left and right aligned items.
set statusline+=%(\ %{&filetype!=#''?&filetype:'\ none'}%)      " Filetype
set statusline+=\ %*                                            " Restore Normal highlight
set statusline+=%{&fileencoding!='utf-8'?''.&fileencoding.'':''} " Encoding
set statusline+=%-7([%{&fileformat}]%)                           " Fileformat
set statusline+=%(\ [%l/%L]%)                                   " Location of cursor line
set statusline+=%(\ \ [%{WordCount()}\ words]%)                 " Show word count

" Live word count
let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

" Vim current mode
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \ 't'  : 'console',
       \}

" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :



