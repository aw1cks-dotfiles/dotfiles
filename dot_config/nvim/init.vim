call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme', { 'do': { -> './install.py --all' } }
Plug 'ekalinin/dockerfile.vim'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'frazrepo/vim-rainbow'
Plug 'mhinz/vim-startify'
Plug 'roxma/vim-paste-easy'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme base16-default-dark
let g:lightline = {
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ 'component': {
       \ 'lineinfo': ' %3l::%-2v',
      	\ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
			\ 'colorscheme': 'base16_default_dark'
      \ }

set ts=2 sw=2 et
set termguicolors
set guicursor=
set noshowmode
set ruler

filetype plugin on
au FileType c,cpp,objc,objcpp call rainbow#load()
map ; :Files<CR>

let g:startify_custom_header =
       \ ['', "   Welcome to NeoVim", '']

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
