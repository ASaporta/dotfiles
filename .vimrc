" Plugins will be downloaded in ('~/.vim/plugged').
" After adding a new plugin, run :PlugInstall to install it.
call plug#begin()
  " Nerdtree + Git plugin (shows git status in nerdtree)
  Plug 'preservim/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'

  " Status/tabline for vim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " close buffer plugin
  Plug 'rbgrouleff/bclose.vim'

  " highlight the current selection when searching
  Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'

  " navigate across vim and tmux windows seamlessly
  " Plug 'christoomey/vim-tmux-navigator'

" Plugins become visible to Vim after this call.
call plug#end()

"========== General Vim Config ==========
syntax on                       " syntax highlighting
set autoread                    " reload files changed outside vim
set backspace=indent,eol,start  " backspace over everything
set hlsearch                    " highlight all search results
set ignorecase                  " do case insensitive search
set incsearch                   " show incremental search results as you type
set lazyredraw                  " buffer screen updates instead of updating all the time (speeds up scrolling)
set noswapfile                  " disable swap file
set number                      " display line number
set paste                       " don't auto-indent any text when pasting
filetype plugin indent on

" set buffers to hidden for editing multiple buffers without saving the mofications when loading other buffers
set hidden

" set shift-arrow to go down and up by a paragraph and to go forward and back by one word
noremap <S-Down> }
noremap <S-Up> {
noremap <S-Right> w
noremap <S-Left> b

" move between vim buffers with ctrl-arrow
noremap <C-Right> :bn<cr>
noremap <C-Left> :bp<cr>

" spell check
" set spell spelllang=en_us
" hi clear SpellBad
" hi SpellBad cterm=underline ctermfg=red

" indentation
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set list listchars=tab:\ \ ,trail:· " display tabs and trailing spaces visually
set nowrap      " don't wrap lines
set linebreak   " wrap lines at convenient points

augroup Markdown
        autocmd!
        autocmd FileType markdown set wrap
augroup END

" set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=234 guibg=#1c1c1c
highlight Visual cterm=reverse

set cursorline                  " underline the current line
set cursorlineopt=line          " only underline the text, not line number
" only show cursor line in the active vim region
autocmd WinEnter,BufEnter,BufWinEnter * set cursorline
autocmd WinLeave,BufLeave,BufWinLeave * set nocursorline
highlight CursorLine cterm=None ctermbg=240

" make vim window split color less eye-catching
highlight VertSplit cterm=None ctermfg=15 ctermbg=None

" folding
"set foldmethod=indent  " fold based on indentation
"set foldnestmax=2      " recursively fold only two down
"set nofoldenable       " don't fold by default
"set foldlevel=1

"========== NERDTree Settings ==========
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | NERDTreeFocus | endif

" Sets NERDTree window width
" let g:NERDTreeWinSize = 20

"========== Airline Settings ==========
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
