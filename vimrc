set nocompatible                " choose no compatibility with legacy vi
set shell=/bin/bash
set t_Co=256
set mouse=a
execute pathogen#infect('$HOME/.vim/bundle/{}')
execute pathogen#helptags()
syntax on
filetype plugin on
filetype indent on

set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " line numbers!
set updatetime=250              " faster update for git gutter

"" Redirect vim shell output
set shellpipe=>

"" Leader key and leader shortcuts
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
nnoremap <Leader><Bar> :vsplit<CR>
nnoremap <Leader><CR> :noh<CR>
nnoremap <Leader><Leader> V
nnoremap <Leader>_ :split<CR>

"" next definition
nnoremap <Leader>dd :tnext<CR>

"" find current word
nnoremap <Leader>e :Ack! <cword><CR>

"" find
nnoremap <Leader>f :Ack!<Space>

"" go to definition
nnoremap <Leader>gd <c-]>

"" go back
nnoremap <Leader>gb <c-t>

"" generate tags
nnoremap <Leader>gt :!ctags --extra=+f -R *<CR><CR>

nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>o :CommandT<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>w :w<CR>
vnoremap <Leader>e y:Ack! <C-r>=fnameescape(@")<CR><CR>

"" Location navigation
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
nnoremap <Leader>[ :Lprev<CR>
nnoremap <Leader>] :Lnext<CR>

"" Add newlines without entering insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

"" Use `jk` for <Esc>
imap jk <Esc>

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
set wildignore=*.pyc,*/.git/*,*/.DS_Store,*/node_modules/*

"" Map word jumping to Alt h/l
nmap <silent> ¬ e
nmap <silent> ˙ b
"" Use Alt j/k to jump to blank lines
nmap <silent> ˚ {
nmap <silent> ∆ }

"" Color and theme
set background=dark


"" Javascript
let g:javascript_plugin_jsdoc = 1

"" Auto-close HTML
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.jinja2,*.j2"

"" Linting
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters = {
\   'python': ['flake8', 'mypy']
\}
let g:ale_python_mypy_options = '--strict'

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" sometimes tabs are 2 spaces
au FileType javascript setl sw=2 sts=2 et

" remove trailing whitespace
autocmd FileType python,javascipt,markdown,go autocmd BufWritePre <buffer> :%s/\s\+$//e

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
set foldmethod=indent
set foldnestmax=2

"" Indent guides
let g:indentLine_char = '┋'

"" Insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd VimEnter * wincmd p

" Emmet abbreviation settings
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings= {
\   'javascript.jsx' : {
\       'extends' : 'jsx',
\   },
\ }
