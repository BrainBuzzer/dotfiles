set nocompatible              " be iMproved, required
filetype off                  " required

""" Plugin Start
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/youcompleteme'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'miyakogi/slateblue.vim'
Plugin 'github/copilot.vim'
Plugin 'mileszs/ack.vim'
Plugin 'wojciechkepka/vim-github-dark'
Plugin 'wakatime/vim-wakatime'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
call vundle#end()            " required
""" Plugin END


filetype plugin indent on    " required

set number
set linespace=5
colorscheme ghdark
set background=dark
let g:airline_theme='murmur'
set cursorline
hi CursorLine term=bold cterm=none ctermfg=none gui=bold


""" NERD Tree Config 
let mapleader = "."
map <leader>. :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
map <leader>, :FZF<CR>

let g:ackprg='rg --vimgrep --type-not sql --smart-case'
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search=1

cnoreabbrev Ack Ack!

nnoremap <leader>/ :Ack!<Space>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

map <c-w> :bd<CR>:NERDTreeToggle<CR>
