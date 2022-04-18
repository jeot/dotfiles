" neovim (Win) init file: "~\AppData\Local\vnim\init.vim"
" neovim (Win) execute in PS: python3 -m pip install --user --upgrade pynvim
" gVim (Win) init file: "~\_vimrc"
" vim (Linux) init file: "~/.vimrc"

set nocompatible
set foldmethod=syntax
set foldlevelstart=-1
set foldnestmax=2
set exrc
set secure
set guicursor=
"set relativenumber
set nohlsearch
set hlsearch
set ignorecase
set smartcase
set hidden
set noerrorbells
set tabstop=4 softtabstop=0 shiftwidth=4
set noexpandtab autoindent smartindent
set number
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
set showcmd
" set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=300
set timeout timeoutlen=3000 ttimeoutlen=10
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
set mouse=a
set viewoptions="folds,options,cursor"
set list " Display unprintable characters f12 - switches
"set listchars=nbsp:×,tab:\ \ ,trail:•,extends:»,precedes:«
set listchars=nbsp:×,tab:•\ ,trail:•,extends:»,precedes:«
set background=dark    " Setting dark mode
set ssop=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set fcs=vert:\ ,fold:-
set cul "cursorline
" set lines=999 columns=999
filetype plugin indent on
syntax on

""""""""""""""" test
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
" set guifont=Consolas:h12

if has("gui_running")
	set guifont=Cascadia_Mono:h12:cANSI:qDRAFT
	" set guioptions-=T " remove toolbar
	" set guioptions-=m " remove menubar
	set guioptions=c
endif

" unix style runtime paths
let &runtimepath="$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after"
" let &runtimepath=",~/.vim" . &runtimepath
" echo &runtimepath
let $RTP=split(&runtimepath, ',')[0]

nnoremap <F3> :-tabe ~/.vimrc<CR> \| :tcd ~<CR>
nnoremap <F4> :source ~/.vimrc<CR>
"nnoremap <F11> :mksession! ~/.vim/.today.ses<cr>
"nnoremap <F12> :source ~/.vim/.today.ses<cr>
if has('win32')

	"echo "Someone please open the Window(s)!"
	"let $RC="$HOME\_vimrc"
	let $RC="$HOME/.vimrc"
	" let $VIMCONFIG="$HOME/.vim"
	unlet! skip_defaults_vim
	source $VIMRUNTIME\defaults.vim
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
	" let $VIMCONFIG="$HOME/.vim"
	set completeopt=menuone,noinsert,noselect,popup
	set undodir=~/.vim/undodir
	"nnoremap <F3> :e ~/.vimrc<CR>
	"nnoremap <F4> :source ~/.vimrc<CR>
	"nnoremap <F11> :mksession! ~/.vim/.today.ses<cr>
	"nnoremap <F12> :source ~/.vim/.today.ses<cr>
	" todo: path for vimwiki
endif

" Install vim-plug: https://github.com/junegunn/vim-plug
" gVim (Win): Download plug.vim and put in "~\vimfiles\autoload" directory.
" neovim (Win): run this in PowerShell:
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vifm/vifm.vim'
"Plug 'takac/vim-hardtime'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-flagship'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'

"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
call plug#end()

" for vimwiki
"let g:vimwiki_list = [{'path': 'D:/Dropbox/Private/my_vimwiki/', 'path_html': '~/public_html/'}]
if has('win32')
	let g:vimwiki_list = [{'path': 'D:/SynologyDrive/Personal/shkVimWiki/', 'path_html': 'D:/SynologyDrive/Personal/shkVimWikiHTM/'}]
elseif has('linux')
	let g:vimwiki_list = [{'path': '~/SynologyDrive/Personal/shkVimWiki/', 'path_html': '~/SynologyDrive/Personal/shkVimWikiHTM/'}]
endif

" coc-extensions
let g:coc_global_extensions = ['coc-json', 'coc-pyright']

augroup vimrc
	" Remove all vimrc autocommands
	autocmd!

	"" gruvbox
	autocmd vimenter * ++nested colorscheme gruvbox

	" set fold method indent for different files
	autocmd FileType vim setlocal foldmethod=indent

	" delete white space at end of lines
	autocmd BufWritePre *.h,*.cpp   :%s/\s\+$//e

	" save/load foldings
	" autocmd BufWinLeave *.h,*.cpp mkview
	" autocmd BufWinEnter *.h,*.cpp silent loadview

	"Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END


" for gruvbox
let g:gruvbox_contrast_dark="soft"
" let g:gruvbox_contrast_dark="medium"
" let g:gruvbox_contrast_dark="hard"

" for flagship
set laststatus=2
set showtabline=2
set guioptions-=e
" for tabline in flagship
" let g:tablabel = "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" my name is shamim keshani "

"" airline theme
" let g:airline_theme='minimalist'
" let g:airline_theme='simple'

"" tender theme
" colorscheme tender

let g:hardtime_default_on = 0
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2


" for nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
nnoremap <c-n> :NERDTreeToggle<CR>

" for FZF (fuzzy file finder)
nnoremap FF :FZF<CR>

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

" error format
"set efm=%f:%l:%c:\ error:\ %m

" yank to end of line
nnoremap Y y$
" center next find
nnoremap n nzzzv
nnoremap N Nzzzv
" more undo poings when writing
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" zooming
"noremap zi <c-w>_ \| <c-w>\|
"noremap zo <c-w>=

let mapleader = " " " map leader to Space

" vimwiki remappings
" nmap <Leader>w<Space> <Plug>VimwikiIndex
nmap <Leader>tl <Plug>VimwikiToggleListItem
vmap <Leader>tl <Plug>VimwikiToggleListItem
" auto indent inside {  }
nnoremap <leader>= =i{
" send commands to be executed in other tmux pane
nnoremap <silent> <leader>et :exe "!tmux send -t .+ 'echo " . getline('.') . "' Enter"<CR>
nnoremap <silent> <leader>ee :exe "!tmux send -t .+ '" . getline('.') . "' Enter"<CR>
" record and repeat keys on multiple lines: qq q
nnoremap <leader><CR> @q
vnoremap <leader><CR> :norm @q<CR>
" moveing lines
nnoremap <leader>kk :m .-2<CR>==
nnoremap <leader>jj :m .+1<CR>==
inoremap <c-k> <Esc>:m .-2<CR>gi
inoremap <c-j> <Esc>:m .+1<CR>gi
vnoremap <c-k> :m '<-2<CR>gv=gv
vnoremap <c-j> :m '>+1<CR>gv=gv
" going around (handled by vim-tmux-navigator)
"nnoremap <C-h> <c-w>h
"nnoremap <C-l> <c-w>l
"nnoremap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
nnoremap <F2> :Explore<CR>
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
" clipboard copy/paste
inoremap <c-p> <ESC>"+pa
nnoremap <c-p> "+p
vnoremap <c-y> "+y
nnoremap <c-y> "+y
" inoremap <leader>p <ESC>"0pa
nnoremap <leader>p "0p
nnoremap <leader>P "0P
nnoremap <leader>riw diw"0P
nnoremap <leader>re de"0P
nnoremap <leader>rb db"0P
nnoremap <leader>rr dd"0P
"initiate multiple line yank
nnoremap <leader>YY "yyy
nnoremap <leader>yy "Yyy
nnoremap <leader>DD "ddd
nnoremap <leader>dd "Ddd
vnoremap <leader>D "dd
vnoremap <leader>d "Dd
" tabs
nnoremap <leader>tt :-tabnew<cr>
nnoremap <leader>TT :tabnew<cr>
" make
nnoremap <leader>ma :wa<cr> \| :make<cr>
nnoremap <leader>mu :wa<cr> \| :make um<cr>
" show command list
nnoremap <leader>; :<c-f>
" show buffer lists (and ready to switch)
" nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>ls :Buffers<CR>
" save file
nnoremap <leader>sf :w<cr>
" close file
nnoremap <leader>q :q<cr>
" close file
nnoremap <leader>Q :q!<cr>
" save and quit buffer
nnoremap <leader>x :wq<cr>
" save session
nnoremap <leader>ss :exe "mksession! " . v:this_session<CR>
" save & source file
nnoremap <leader>so :w<BAR>source %<cr>
" save all files and session
nnoremap <leader>sa :wall<CR>
" quit buffer without closing window
" nnoremap <leader>qf :bp<bar>sp<bar>bn<bar>bd<CR>
" quit vim
nnoremap <leader>ZZ :wqall<CR>
nnoremap <leader>ZQ :qall<CR>

" replace in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-s> "hy:%s/\<<C-r>h\>//gc<left><left><left>
" count
nnoremap <A-v> "hyiw:%s/<C-r>h//gn
vnoremap <A-v> "hy:%s/<C-r>h//gn

""""""""" coc """""""""
source ~/.vim/coc.vim

" foldings
nnoremap <space><space> za
nnoremap zo zO

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
