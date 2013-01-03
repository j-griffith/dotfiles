syntax on

set nocompatible
let mapleader=","
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set number
set paste
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set hlsearch
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set textwidth=80
set shiftround
set t_Co=256
set completeopt=menuone,longest,preview
set pumheight=6      " limit size of completion window

set cursorline
set ruler
set nostartofline
set scrolloff=3
set backspace=2
set showmatch
set nowrap
set mouse+=a	"so we can copy without capturing line numbers of both windows in vsp mode
set ttymouse=xterm2
set clipboard=autoselect

" don't outdent these please!
inoremap # #


" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set ignorecase
set smartcase    " unless I actually provide uppercase
set smarttab

command! W :w    " Annoying error!!!
" sudo write
"" cmap W! w !sudo tee % >/dev/null

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if has("gui_running")
    set background=dark
    set guifont=Liberation\ Mono\ 08
	set guioptions-=T
	colorscheme irbm
	"colorscheme aldmeris
else
    set background=dark
	" let g:aldmeris_termcolors="tango"
	"colorscheme aldmeris
	colorscheme irbm
endif

" ===========================================
" Enhanced keyboard mappings
" ===========================================
nnoremap <F2> :set nonumber!<CR>
nmap <silent> <Leader>n :set nonumber!<CR>
nmap <C-P> :NERDTreeToggle<CR>
nmap <Leader>o :NERDTreeToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
nmap <Leader>l :TlistToggle<CR>
nmap <F4> :TlistToggle<CR>
nnoremap <leader>a :Ack
inoremap jj <Esc>
let g:CommandTAcceptSplitMap=['<C-s>', '<C-CR>', '<C-b>']

" ================================================
" make navigating the split window keys nicer
" ================================================
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


filetype plugin indent on
autocmd BufWritePre * :%s/\s\+$//e    " remove trailing whitespace in all files

" ================================================
" python settings
" ================================================
map <leader>g :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 nowrap smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Educate smartindent, don't de-dent comment lines
autocmd BufRead *.py inoremap # X<c-h>#


if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set nofoldenable
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>
