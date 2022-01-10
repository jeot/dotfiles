" neovim (Win) init file: "~\AppData\Local\vnim\init.vim"
" neovim (Win) execute in PS: python3 -m pip install --user --upgrade pynvim
" gVim (Win) init file: "~\_vimrc"
" vim (Linux) init file: "~/.vimrc"

set exrc
set secure
set guicursor=
set relativenumber
set nohlsearch
set hlsearch
set ignorecase
set smartcase
set hidden
set noerrorbells
set tabstop=4 softtabstop=0 shiftwidth=4
set noexpandtab autoindent smartindent
set guifont=Consolas:h12
set nu
set wrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undofile
set incsearch
set termguicolors
set scrolloff=4
set showmode
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=300
set shortmess+=c
set encoding=utf-8
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set laststatus=2
set path=.,**,$HOME
set wildmenu
set nopaste
set autoread
set ttymouse=xterm2

filetype plugin indent on
syntax on

let $RTP=split(&runtimepath, ',')[0]

nnoremap <F3> :e ~/.vimrc<CR>
nnoremap <F4> :source ~/.vimrc<CR>
nnoremap <F11> :mksession! ~/.vim/.today.ses<cr>
nnoremap <F12> :source ~/.vim/.today.ses<cr>
if has('win32')
	"echo "Someone please open the Window(s)!"
	"let $RC="$HOME\_vimrc"
	let $RC="$HOME\.vimrc"
	unlet! skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
	set completeopt=menuone,noinsert,noselect,popup
	"nnoremap <F3> :e ~\_vimrc<CR>
	"nnoremap <F4> :source ~\_vimrc<CR>
	if has('nvim') " neovim
		au VimEnter * GuiPopupmenu 0
		set completeopt=menuone,noinsert,noselect
		tnoremap <Esc> <C-\><C-n>
		nnoremap <F3> :e ~\AppData\Local\nvim\init.vim<CR>
		nnoremap <F4> :source ~\AppData\Local\nvim\init.vim<CR>
	endif
elseif has('linux')
	"echo "we are in linux!"
	let $RC="$HOME/.vimrc"
	set completeopt=menuone,noinsert,noselect,popup
	set undodir=~/.vim/undodir
	"nnoremap <F3> :e ~/.vimrc<CR>
	"nnoremap <F4> :source ~/.vimrc<CR>
	"nnoremap <F11> :mksession! ~/.vim/.today.ses<cr>
	"nnoremap <F12> :source ~/.vim/.today.ses<cr>
endif

" Install vim-plug: https://github.com/junegunn/vim-plug
" gVim (Win): Download plug.vim and put in "~\vimfiles\autoload" directory.
" neovim (Win): run this in PowerShell:
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'takac/vim-hardtime'
Plug 'tpope/vim-unimpaired'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if has('win32')
	"Plug 'ycm-core/YouCompleteMe'
endif
if has('nvim')
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
endif
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

colorscheme tender
let g:hardtime_default_on = 0
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

 "Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" for nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
nnoremap <c-n> :NERDTreeToggle<CR>

" for FZF (fuzzy file finder)
nnoremap FF :FZF<CR>

" error format
"set efm=%f:%l:%c:\ error:\ %m

"Key mappings
"inoremap <S-CR> <ESC>
"nnoremap <S-CR> <ESC>
"vnoremap <S-CR> <ESC>gV
"onoremap <S-CR> <Esc>
"cnoremap <S-CR> <C-C><Esc>
" record and repeat keys on multiple lines: qq q
nnoremap <space><CR> @q
vnoremap <space><CR> :norm @q<CR>
" Find files using Telescope command-line sugar.
"nnoremap <space>ff <cmd>Telescope find_files<cr>
"nnoremap <space>fg <cmd>Telescope live_grep<cr>
"nnoremap <space>fb <cmd>Telescope buffers<cr>
"nnoremap <space>fh <cmd>Telescope help_tags<cr>
" moveing lines
nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>
inoremap <A-k> <Esc>:m-2<CR>gi
inoremap <A-j> <Esc>:m+<CR>gi
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv
nnoremap <A-l> xp
nnoremap <A-h> xhP
nnoremap <A-e> xep
nnoremap <A-b> xbP

" going around
"nnoremap <C-h> <c-w>h
"nnoremap <C-l> <c-w>l
"nnoremap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
nnoremap <F2> :Explore<CR>
nnoremap J ]m
nnoremap K [m
vnoremap J ]m
vnoremap K [m

" clipboard/copy/paste
inoremap <c-t> <ESC>"+pa
nnoremap <c-t> "+p
vnoremap <c-y> "+y
nnoremap <c-y> "+y
inoremap <c-p> <ESC>"0pa
nnoremap <c-p> "0p
inoremap <c-'> <ESC>""pa
nnoremap <c-'> ""p
nnoremap <M-J> :join<CR>
" show buffer lists (and ready to switch)
nnoremap gl :ls<cr>:b<space>
" replace in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-s> "hy:%s/\<<C-r>h\>//gc<left><left><left>
" count
nnoremap <A-v> "hyiw:%s/<C-r>h//gn
vnoremap <A-v> "hy:%s/<C-r>h//gn

""""""""" YCM & Clangd
"let g:ycm_auto_hover=''
"let g:ycm_clangd_uses_ycmd_caching = 0
"let g:ycm_add_preview_to_completeopt = 0
"nmap <leader>D <plug>(YCMHover)
"nmap <leader><leader> :YcmCompleter GoTo<CR>
"nmap <leader>gd :YcmCompleter GetDoc<CR>
"nmap <leader>gt :YcmCompleter GetType<CR>
"nmap <leader>gp :YcmCompleter GetParent<CR>
"nmap <leader>i :YcmCompleter GoToInclude<CR>
"nmap <leader>f :YcmCompleter GoToDefinition<CR>
"nmap <leader>d :YcmCompleter GoToDeclaration<CR>
"nmap <leader>yd :YcmDiags<CR>
"nmap <leader>fi :YcmCompleter FixIt<CR>

""""""""" coc """""""""
source ~/.vim/coc.vim
finish

""" quickfix """
noremap <c-m> :call QuickFixWindowToggle()<CR>
let g:quick_fix_is_open = 0  
function! QuickFixWindowToggle()
if g:quick_fix_is_open == 1
  cclose
  let g:quick_fix_is_open = 0 
else
  copen
  let g:quick_fix_is_open = 1 
endif
endfunction

""" location window """
" toggle location window
noremap <c-x> :call LocationListWindowToggle()<CR>
let g:location_list_is_open = 0  
function! LocationListWindowToggle()
if g:location_list_is_open == 1
  lclose
  let g:location_list_is_open = 0 
else
  lopen
  let g:location_list_is_open = 1 
endif
endfunction
   
