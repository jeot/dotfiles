require('packer').startup(
function()
	use 'wbthomason/packer.nvim'
	use 'cohama/lexima.vim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'sainnhe/gruvbox-material'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'christoomey/vim-tmux-navigator'
	vim.g.tmux_navigator_disable_when_zoomed = 1
	use {
	'vimwiki/vimwiki',
	config = function()
		local opts = {}
		if vim.fn.has('win32') == 1 then
			opts = {
				{
					path = 'D:/SynologyDrive/Personal/shkVimWiki/',
					path_html = 'D:/SynologyDrive/Personal/shkVimWikiHTM/'
				}
			}
		elseif vim.fn.has('linux') == 1 then
			opts = {
				{
					path = '~/SynologyDrive/Personal/shkVimWiki/',
					path_html = '~/SynologyDrive/Personal/shkVimWikiHTM/'
				}
			}
		else opts = {} end
		vim.g.vimwiki_list = opts
	end
	}
	use {
	'goolord/alpha-nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
		local startify = require('alpha.themes.startify')
		startify.section.bottom_buttons.val = {
			startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
			startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
			startify.button("ai", "neovim config", ":e ~/app_installs.md<cr>"),
			startify.button("x", ".vimrc config", ":e ~/.vimrc<cr>"),
			startify.button("q", "quit nvim", ":qa<cr>")
		}
		vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', { noremap = true })
	end
	}

	-- IDE
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	require'nvim-treesitter.configs'.setup {
		ensure_installed = "all",
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		}
	}
	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	require("nvim-lsp-installer").on_server_ready(function(server)
		local opts = {}
		if server.name == "sumneko_lua" then
			opts = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim', 'use' }
						},
					}
				}
			}
		end
		server:setup(opts)
	end)
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'tpope/vim-obsession'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		}
	}
	require'nvim-tree'.setup { }
end)
