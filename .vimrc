" neovim (Win) init file: "~\AppData\Local\vnim\init.vim"
" neovim (Win) execute in PS: python3 -m pip install --user --upgrade pynvim
" gVim (Win) init file: "~\_vimrc"
" vim (Linux) init file: "~/.vimrc"

set nocompatible
set foldmethod=syntax
set foldlevelstart=0
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
set mouse=a
set viewoptions="folds,options,cursor"
set list " Display unprintable characters f12 - switches
"set listchars=nbsp:×,tab:\ \ ,trail:•,extends:»,precedes:«
set listchars=nbsp:×,tab:•\ ,trail:•,extends:»,precedes:«
set background=dark    " Setting dark mode
set ssop=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set fcs=vert:\ ,fold:-,eob:\ 
" set lines=999 columns=999
filetype plugin indent on
syntax on

" set guifont=Consolas:h12
if has("gui_running")
	set guifont=Cascadia_Mono:h13:cANSI:qDRAFT
endif


let $RTP=split(&runtimepath, ',')[0]

nnoremap <F3> :-tabe ~/.vimrc<CR> \| :tcd ~<CR>
nnoremap <F4> :source ~/.vimrc<CR>
"nnoremap <F11> :mksession! ~/.vim/.today.ses<cr>
"nnoremap <F12> :source ~/.vim/.today.ses<cr>
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
" Plug 'tpope/vim-endwise'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
"Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
call plug#end()

" for vimwiki
let g:vimwiki_list = [{'path': 'D:/SynologyDrive/Personal/shkVimWiki/', 'path_html': 'D:/SynologyDrive/Personal/shkVimWikiHTM/'}]
"let g:vimwiki_list = [{'path': 'D:/Dropbox/Private/my_vimwiki/', 'path_html': '~/public_html/'}]

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


" for flagship
set laststatus=2
set showtabline=2
set guioptions-=e
" for tabline in flagship
" let g:tablabel = "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"
let g:tablable = "hello"

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"" airline theme
let g:airline_theme='minimalist'

"" tender theme
"colorscheme tender

let g:hardtime_default_on = 0
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2


" for nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
nnoremap <c-n> :NERDTreeToggle<CR>

" for FZF (fuzzy file finder)
nnoremap FF :FZF<CR>
nnoremap FA :FZF ..<CR>

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
if has('gui_running')
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
else
	" nnoremap j :m+<CR>
	" nnoremap k :m-2<CR>
	" inoremap k <Esc>:m-2<CR>gi
	" inoremap j <Esc>:m+<CR>gi
	" vnoremap j :m'>+<CR>gv
	" vnoremap k :m-2<CR>gv
	" nnoremap l xp
	" nnoremap h xhP
	" nnoremap e xep
	" nnoremap b xbP
endif

" zooming
"noremap zi <c-w>_ \| <c-w>\|
"noremap zo <c-w>=

" going around
"nnoremap <C-h> <c-w>h
"nnoremap <C-l> <c-w>l
"nnoremap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
nnoremap <F2> :Explore<CR>
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
" clipboard/copy/paste
inoremap <c-t> <ESC>"+pa
nnoremap <c-t> "+p
vnoremap <c-y> "+y
nnoremap <c-y> "+y
inoremap <c-p> <ESC>"0pa
nnoremap <c-p> "0p
nnoremap <leader>riw diw"0P
nnoremap <leader>rr dd"0P
"initiate multiple line yank
nnoremap <leader>YY "lyy
nnoremap <leader>yy "Lyy
" nnoremap <leader>L "lyy
" nnoremap <leader>l "Lyy
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
" show buffer lists (and ready to switch)
nnoremap <leader>b :ls<cr>:b<space>
" save file
nnoremap <leader>w :w<cr>
" save & source file
nnoremap <leader>ss :w<BAR>so %<cr>
" save all files and session
nnoremap <leader>sa :wa<BAR>exe "mksession! " . v:this_session<CR>
nnoremap <leader>wa :wa<BAR>exe "mksession! " . v:this_session<CR>
" quit buffer without closing window
nnoremap <leader>qq :bp<bar>sp<bar>bn<bar>bd<CR>
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

" foldings
nnoremap <space><space> za

finish

function! Wipeout()
	" list of *all* buffer numbers
	let l:buffers = range(1, bufnr('$'))
	" what tab page are we in?
	let l:currentTab = tabpagenr()
	try
		" go through all tab pages
		let l:tab = 0
		while l:tab < tabpagenr('$')
			let l:tab += 1
			" go through all windows
			let l:win = 0
			while l:win < winnr('$')
				let l:win += 1
				" whatever buffer is in this window in this tab, remove it from
				" l:buffers list
				let l:thisbuf = winbufnr(l:win)
				call remove(l:buffers, index(l:buffers, l:thisbuf))
			endwhile
		endwhile
		" if there are any buffers left, delete them
		if len(l:buffers)
			execute 'bwipeout' join(l:buffers)
		endif
	finally
		" go back to our original tab page
		execute 'tabnext' l:currentTab
	endtry
endfunction

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
