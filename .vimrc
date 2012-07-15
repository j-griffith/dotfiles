call pathogen#infect()

set nocompatible
let mapleader=","
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nonumber
set paste
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set hls
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

" don't outdent these please!
inoremap # #


syntax on

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
	colorscheme ir_black
	"colorscheme aldmeris
else
    set background=dark
	" let g:aldmeris_termcolors="tango"
	"colorscheme aldmeris
	colorscheme ir_black
endif

" ===========================================
" Enhanced keyboard mappings
" ===========================================
nnoremap <F8> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

nmap <F2> :w<CR>    " F2 saves in normal mode
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :!ctags -R .c++-kinds=+p .fields=+iaS .extra=+q .<CR>

" build using makeprg with <F7>
map <F7> :make<CR>

" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" goto definition with F12
map <F12> <C-]>

" in diff mode we use the spell check keys for merging
map <C-J> <C-W>j<15C-W>_
map <C-K> <C-W>k<15C-W>_
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
endif

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

