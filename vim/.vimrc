" START PLUGINS
"
set nocompatible              " be iMproved, required
filetype off                  " required

" Consider migrating from Vundle to vim-plug:
" https://github.com/junegunn/vim-plug
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
" Plugin 'ycm-core/YouCompleteMe'

" Surround
Plugin 'tpope/vim-surround'

" Command-T
Plugin 'wincent/command-t'
let g:CommandTPreferredImplementation='lua'

" snipMate
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

" vimtex (LaTeX)
" See: https://wikimatze.de/vimtex-the-perfect-tool-for-working-with-tex-and-vim/
Plugin 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_bib_simple = 1
let g:tex_flavor = 'latex'

" Syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_post_args="--max-line-length=88"
let g:pymode_lint_ignore = "E501,W"
" Toggle with Ctrl-W E
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>

" Air-line
Plugin 'vim-airline/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Rainbow CSV
" For better visualization of CSV files
" See: https://github.com/mechatroner/rainbow_csv
" Alternative: https://github.com/chrisbra/csv.vim
Plugin 'mechatroner/rainbow_csv'
let g:disable_rainbow_csv_autodetect = 1 " disable autodetect
" Activate by:
" :set ft=csv

" SympylFold (Python code folding)
" Plugin 'tmhedberg/SimpylFold'
"
" Black (Python linter)
" Plugin 'psf/black'
"
" Linediff
Plugin 'AndrewRadev/linediff.vim'

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
"
" END PLUGINS
"
"---------------------------------------------------------------------------------------
"
" sensible.vim from https://github.com/tpope/vim-sensible
" START of sensible.vim
" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
" END of sensible.vim

"---------------------------------------------------------------------------------------

" Colorscheme: elflord
colorscheme elflord
" Colorscheme: slate
" colorscheme slate

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Line numbers
set number

" Make search "smartcase"-sensitive: Uppercase is sensitive; lowercase is not
" A search can always be made case-sensitive with \C in the end
" See: https://vim.fandom.com/wiki/Searching
set ignorecase
set smartcase

""" Set Python column limits
" Color column at 88 characters
" See: http://vim.wikia.com/wiki/Automatic_word_wrapping
" See: https://robots.thoughtbot.com/wrap-existing-text-at-80-characters-in-vim
au BufRead,BufNewFile *.py setlocal colorcolumn=88
au BufRead,BufNewFile *.py setlocal textwidth=87
au BufRead,BufNewFile *.py setlocal formatoptions+=t

""" Flag unnecessary whitespaces in Python
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" Set 2-spaces indent for specific languages (HTML, YAML, TEX, etc.)
au BufRead,BufNewFile *.html,*.yml,*.tex setlocal tabstop=2
au BufRead,BufNewFile *.html,*.yml,*.tex setlocal shiftwidth=2

" map gr to go-to-previous-tab
nmap gr gT

" Allow changing buffer without write
set hidden

" Highlight current line (toggle with \h)
set cursorline
hi CursorLine cterm=NONE ctermbg=Black guibg=Black
:nnoremap <Leader>h :set cursorline!<CR>

"Comment/uncomment with #/'# in Visual mode
vnoremap <silent> # :s/^/# /<cr>:noh<cr>
vnoremap <silent> '# :s/^# //<cr>:noh<cr>
"
" LaTeX comments
au BufRead,BufNewFile *.tex vnoremap <silent> # :s/^/% /<cr>:noh<cr>
au BufRead,BufNewFile *.tex vnoremap <silent> '# :s/^% //<cr>:noh<cr>

" Python: set idbp breakpoint line in register i
" See: https://blog.afoolishmanifesto.com/posts/editing-registers-in-vim-regedit
:let @i='import ipdb; ipdb.set_trace()'

" Python: set Parameters\n----------\n in register p
:let @p="Parameters\n----------\n"

" Python: set Returns\n-------\n in register r
:let @r="Returns\n-------\n"

" Folding
set foldmethod=indent
set foldlevel=4
set nofoldenable

" Delete buffer without closing split, setting previously used buffer on the split 
:command Bq bp\|bd #

" List contents of the first registers when typing "".
nnoremap <silent> "" :registers "01234/.<CR>

" Mappings to access buffers (don't use '\p' because a
" delay before pressing 'p' would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Togle paste mode with F3
set pastetoggle=<F3>

" vim as a text-processor
" See: https://www.maketecheasier.com/turn-vim-word-processor/
" See: https://www.linux.com/learn/using-spell-checking-vim
func! TextProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " Disable python colorcolumn
    set colorcolumn=0
  " spelling and thesaurus
"   setlocal spell spelllang=en_us,en_gb
 setlocal spell spelllang=en_gb
"  setlocal spell spelllang=en_us
  set thesaurus+=/home/alex/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! TP call TextProcessor()

" Block of comments in .tex documents: [Visual] Shift+S C
" See: https://two-wrongs.com/custom-surrounding-text-with-surroundvim
let g:surround_67 = "\\begin{comment}\n\r\n\\end{comment}"

" Avoid scrolling when switch buffers
" See: https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
" Avoid scrolling when switch buffers

" Map word count to F4
map <F4> :!wc -m %<CR>
