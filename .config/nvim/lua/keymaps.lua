-- set leader key
vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
local function nkeymap(key, map) -- Normal
	keymap('n', key, map, opts)
end
local function ikeymap(key, map) -- Insert
	keymap('i', key, map, opts)
end
local function vkeymap(key, map) -- Visual
	keymap('v', key, map, opts)
end
local function xkeymap(key, map) -- Visual Block
	keymap('x', key, map, opts)
end

if vim.fn.has('win32') == 1 then
	nkeymap('<F3>', '<cmd>tabe ~/AppData/local/nvim/init.lua<CR> <bar> :tcd ~/.config/nvim<CR>')
	nkeymap('<F4>', '<cmd>source ~/AppData/local/nvim/init.lua<CR>')
elseif vim.fn.has('linux') == 1 then
	nkeymap('<F3>', '<cmd>tabe ~/.config/nvim/init.lua<CR> <bar> :tcd ~/.config/nvim<CR>')
	nkeymap('<F4>', '<cmd>source ~/.config/nvim/init.lua<CR>')

else
	error("invalid os")
end

-- window movement is handled by vim-tmux-navigator
-- nkeymap('<c-h>', '<c-w>h')
-- nkeymap('<c-j>', '<c-w>j')
-- nkeymap('<c-k>', '<c-w>k')
-- nkeymap('<c-l>', '<c-w>l')

-- it's more personal
-- ikeymap('jk', '<Esc>')
-- ikeymap('kj', '<Esc>')
-- ikeymap('<c-space>', '<Esc>')
nkeymap('<leader>th', ':tab help ') -- create new tab with a new empty buffer
nkeymap('<leader>tt', ':tab split<cr>') -- create new tab with same buffer
nkeymap('<leader>TT', ':tabnew<cr>')
nkeymap('ZT', ':tabclose<cr>|:tabprevious<cr>') -- close tab and show the previous one
nkeymap('T', ':tabnext<cr>')
nkeymap('W', '<c-w><c-w>')
nkeymap('Y', 'y$') -- yank to end if line
nkeymap('<leader>;', ':<c-f>k') -- show command history
nkeymap('<leader>:', '@:') -- execute last command
nkeymap('<leader>j', ':join<cr>') -- join the lines
vkeymap('<leader>j', ':join<cr>')
nkeymap('<leader>k', 'k:join<cr>')
vkeymap('<leader>k', 'k:join<cr>')
nkeymap('<leader>h', ':help ')
nkeymap('<leader>on', ':e ~/.config/nvim/init.lua<cr>')
nkeymap('<leader>oa', ':e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>')
nkeymap('<leader>oA', ':e C:/Users/shk/AppData/Roaming/alacritty/alacritty.yml<cr>')
nkeymap('<space><space>', 'zA') -- folding
nkeymap('<leader>id', ':r! node "C:\\Users\\shk\\working\\pgyfc_test_app\\test.js"<cr>') -- insert persian date
nkeymap('<leader>f"', '/".\\{-}"<cr>')

-- navigation
nkeymap('J', '}')
nkeymap('K', '{')
vkeymap('J', '}')
vkeymap('K', '{')
nkeymap('L', ':bnext<CR>')
nkeymap('H', ':bprevious<CR>')
nkeymap('R', ':bnext<CR>')
nkeymap('E', ':bprevious<CR>')

-- changing directories
nkeymap('<leader>gcd', '<cmd>cd %:p:h<cr>') -- change global directory to current buffer
nkeymap('<leader>lcd', '<cmd>lcd %:p:h<cr>') -- change local window directory to current buffer

nkeymap('n', 'nzvzz') -- center find
nkeymap('N', 'Nzvzz')

ikeymap(',', ',<c-g>u') -- insert additional undo points
ikeymap('.', '.<c-g>u')
ikeymap('!', '!<c-g>u')
ikeymap('?', '?<c-g>u')

nkeymap('<leader>=', '=i{') -- auto indent inside {} block

-- vimwiki
keymap('n', '<Leader>tl', '<Plug>VimwikiToggleListItem', { silent = true })
keymap('v', '<Leader>tl', '<Plug>VimwikiToggleListItem', { silent = true })
keymap('n', '<Leader>ll', '<Plug>VimwikiListToggle', { silent = true })
keymap('v', '<Leader>ll', '<Plug>VimwikiListToggle', { silent = true })

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gy', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('gK', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('gk', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('gn', ':lua vim.diagnostic.goto_next()<cr>zvzz')
nkeymap('gp', ':lua vim.diagnostic.goto_prev()<cr>zvzz')
--nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- copy/paste/replace stuff
ikeymap('<c-p>', '<ESC>"+pa') -- system clipboard
nkeymap('<c-p>', '"+p')
vkeymap('<c-y>', '"+y')
nkeymap('<c-y>', '"+y')
nkeymap('<leader>p', '"0p') -- from yanked register
nkeymap('<leader>P', '"0P')
vkeymap('<leader>p', '"0p')
vkeymap('<leader>P', '"0P')
nkeymap('<leader>riw', 'diw"0P') -- replace with yanked
nkeymap('<leader>ri(', 'di("0P')
nkeymap('<leader>ri)', 'di)"0P')
nkeymap('<leader>ri"', 'di""0P')
nkeymap('<leader>ri\'', 'di\'"0P')
nkeymap('<leader>re', 'de"0P')
nkeymap('<leader>rb', 'db"0P')
nkeymap('<leader>rr', 'dd"0P')
nkeymap('<leader>YY', '"xyy') -- multi line yank/cut
nkeymap('<leader>yy', '"Xyy')
vkeymap('<leader>Y', '"xy')
vkeymap('<leader>y', '"Xy')
nkeymap('<leader>DD', '"xdd')
nkeymap('<leader>dd', '"Xdd')
vkeymap('<leader>D', '"xd')
vkeymap('<leader>d', '"Xd')
nkeymap('<leader>x', '"xp') -- paste multi
nkeymap('<leader>R', '"hyiw:%s/<C-r>h//gc<left><left><left>') -- interactive replace
vkeymap('<leader>R', '"hy:%s/<C-r>h//gc<left><left><left>') -- interactive replace
nkeymap('<leader><c-n>', '"hyiw:%s/<C-r>h//gn<cr>') -- count keyword
vkeymap('<leader><c-n>', '"hy:%s/<C-r>h//gn<cr>') -- count keyword
vkeymap("p", '"_dP') -- while pasting on top of visual selection, hold the yanked register

-- telescope & nvim-tree
-- nkeymap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>') -- default
nkeymap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files({no_ignore = true})<cr>') -- with gitignored files
nkeymap('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
nkeymap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
nkeymap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
nkeymap('<leader>fa', '<cmd>lua require("telescope.builtin").find_files({search_file=vim.fn.expand("<cword>")})<cr>') -- find file under cursor
nkeymap('<leader>fs', '<cmd>lua require("telescope.builtin").grep_string()<cr>') -- grep string under cursor
nkeymap('<leader>fe', '<cmd>NvimTreeToggle<CR>')


-- execute command line under cursor
nkeymap('<leader>et', ':exe "!tmux send -t .+ \'echo " . vim.fn.getline(".") . "\' Enter"<CR>')
nkeymap('<leader>ee', ':exe "!tmux send -t .+ \'" . vim.fn.getline(".") . "\' Enter"<CR>')
nkeymap('<leader>E', ':exe "!" . getline(".")<CR>')

-- repeat macro
nkeymap('<leader><CR>', '@q')
vkeymap('<leader><CR>', ':norm @q<CR>')

-- stay in indent mode (while in visual mode)
vkeymap("<", "<gv")
vkeymap(">", ">gv")

-- moving lines ! surprisingly Alt works in nvim!
nkeymap('<ca-k>', ':m .-2<CR>')
nkeymap('<ca-j>', ':m .+1<CR>')
ikeymap('<ca-k>', '<Esc>:m .-2<CR>')
ikeymap('<ca-j>', '<Esc>:m .+1<CR>')
vkeymap('<ca-k>', ":m '<-2<CR>gv")
vkeymap('<ca-j>', ":m '>+1<CR>gv")
xkeymap("<ca-j>", ":m '>+1<CR>gv")
xkeymap("<ca-k>", ":m '<-2<CR>gv")

-- make toolchain
nkeymap('<leader>ma', ':wa<cr> <bar> :make<cr>') -- make
nkeymap('<leader>mu', ':wa<cr> <bar> :make ') -- make something

-- file/buffer
-- nkeymap('<F2>', ':Explore<CR>') -- open file explorer
nkeymap('<leader>fp', '1<c-g>') -- save buffer
nkeymap('<leader>sf', ':w<cr>') -- save buffer
nkeymap('<c-s>', ':w<CR>') -- save buffer
ikeymap('<c-s>', '<Esc>:w<CR>a') -- save buffer
nkeymap('<leader>q', ':Bdelete<CR>') -- delete buffer, but don't close window (using vim-bbye plugin)
nkeymap('<leader>Q', ':qall<CR>') -- close all
nkeymap('<leader>ss', ':exe "mksession! " . v:this_session<CR>') -- save session
nkeymap('<leader>so', ':w <bar> source %<cr>') -- save & source file
nkeymap('<leader>sa', ':wall<CR>') -- save all files
nkeymap('ZQ', ':bd!<cr>') -- close buffer without saving, don't close window
nkeymap('ZZ', ':w <bar> Bdelete<CR>') -- save buffer and close, don't close window

-- window stuff
nkeymap('<leader>wq', '<c-w>c') -- close window (safe)
nkeymap('<leader>wc', '<c-w>c') -- close window (safe)
nkeymap('<leader>we', '<c-w>c') -- close window (safe)
nkeymap('<leader>wr', '<c-w>r') -- rotate windows
nkeymap('<leader>ws', '<c-w>s') -- split windows
nkeymap('<leader>wv', '<c-w>v') -- split vertical windows
nkeymap('<leader>wf', '<c-w>f') -- open filepath in split window
nkeymap('<leader>wo', '<c-w>o') -- make only window
nkeymap('<leader>wh', '<c-w>h') -- additional window navigation
nkeymap('<leader>wj', '<c-w>j')
nkeymap('<leader>wk', '<c-w>k')
nkeymap('<leader>wl', '<c-w>l')
nkeymap('<leader>w=', '<c-w>=') -- equal window size
nkeymap('<leader>wn', '<c-w>n') -- new edit window (split)
nkeymap('<leader>wH', '<c-w>H') -- moveing windows
nkeymap('<leader>wJ', '<c-w>J')
nkeymap('<leader>wK', '<c-w>K')
nkeymap('<leader>wL', '<c-w>L')
nkeymap('<leader>wT', '<c-w>T')

-- resize windows with arrows
nkeymap("<C-Up>", ":resize +2<CR>")
nkeymap("<C-Down>", ":resize -2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")
nkeymap("<C-Right>", ":vertical resize +2<CR>")

