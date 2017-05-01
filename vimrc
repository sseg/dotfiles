set nocompatible                " choose no compatibility with legacy vi
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin on
filetype indent on

set encoding=utf-8
set showcmd                     " display incomplete commands
set mouse=a                     " mousing about!
set number                      " line numbers!
set updatetime=250              " faster update for git gutter
autocmd vimenter * NERDTree     " start NERDTree for every session

"" Redirect vim shell output
set shellpipe=>

"" Leader key and leader shortcuts
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :Ack!<Space>
nnoremap <Leader>e :Ack! <cword><CR>
vnoremap <Leader>e y:Ack! <C-r>=fnameescape(@")<CR><CR>
nnoremap <Leader>o :CommandT<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader><Leader> V
nnoremap <Leader><CR> :noh<CR>
nnoremap <Leader>_ :split<CR>
nnoremap <Leader><Bar> :vsplit<CR>
nnoremap <Leader><Esc>[A :wincmd k<CR>
nnoremap <Leader><Esc>[B :wincmd j<CR>
nnoremap <Leader><Esc>[C :wincmd l<CR>
nnoremap <Leader><Esc>[D :wincmd h<CR>

"" Cursor scrolling
set scrolloff=5

"" Undo files
if !isdirectory("/tmp/vim_undo")
    call mkdir("/tmp/vim_undo", "", 0700)
endif
set undodir=/tmp/vim_undo
set undofile

"" File menu matching
set wildmenu
set wildmode=list:longest,full
set wildignore=*.pyc,*/.git/*,*/.DS_Store

"" Map word jumping to Alt + arrow L/R
nmap <silent> <Esc><Esc>[C e
nmap <silent> <Esc><Esc>[D b
"" Use Alt + arrow U/D to jump to blank lines 
nmap <silent> <Esc><Esc>[A {
nmap <silent> <Esc><Esc>[B }

"" NERDTree
let g:NERDTreeDirArrowExpandable = '📁'
let g:NERDTreeDirArrowCollapsible = '📂'
let NERDTreeShowHidden = 1

function! NERDTreeHighlightFile(extension, fg, bg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction

" source files
call NERDTreeHighlightFile('py', 'green', 'black')
call NERDTreeHighlightFile('js', 'green', 'black')
call NERDTreeHighlightFile('sql', 'green', 'black')

" data files
call NERDTreeHighlightFile('json', 'blue', 'black')
call NERDTreeHighlightFile('yaml', 'blue', 'black')
call NERDTreeHighlightFile('yml', 'blue', 'black')

" readables
call NERDTreeHighlightFile('md', 'red', 'black')
call NERDTreeHighlightFile('rst', 'red', 'black')

" executables and related
call NERDTreeHighlightFile('Makefile', 'magenta', 'black')
call NERDTreeHighlightFile('sh', 'magenta', 'black')

call NERDTreeHighlightFile('in', 'cyan', 'black')
call NERDTreeHighlightFile('txt', 'cyan', 'black')
call NERDTreeHighlightFile('cfg', 'cyan', 'black')
call NERDTreeHighlightFile('opts', 'cyan', 'black')
call NERDTreeHighlightFile('lock', 'cyan', 'black')

"" Javascript
let g:javascript_plugin_jsdoc = 1

"" Linting
let g:ale_linters = {
            \ 'javascript': ['eslint']
            \}

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set softtabstop=4

"" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"" The silver surfer!
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev Ack Ack!

"" markdown plugin
let g:vim_markdown_folding_disabled = 1

"" Folding
set foldmethod=syntax

"" Indent guides
let g:indentLine_char = '┋'

autocmd VimEnter * wincmd p
