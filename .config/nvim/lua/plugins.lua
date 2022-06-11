-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function()
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"

	-- colorscheme
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
	-- use 'sainnhe/gruvbox-material'
	use "lunarvim/darkplus.nvim"
	-- use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	-- require('lualine').setup { options = { theme = 'dracula' } }
	-- use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
	use 'itchyny/lightline.vim'
	use 'mengelbrecht/lightline-bufferline'

	-- cmp plugins
	use { "hrsh7th/nvim-cmp", branch = 'main'} -- The completion plugin
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	-- for luasnip
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	-- For vsnip users.
	-- use 'hrsh7th/cmp-vsnip'
	-- use 'hrsh7th/vim-vsnip'-- snippets

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- run this command after: LspInstall clangd cssls html jsonls sumneko_lua pyright
	-- !! the following setup don't work and I don't know why!
	-- require'nvim-lsp-installer'.setup({
	-- 	-- ensure_installed = { "clangd", "cssls", "html", "jsonls", "sumneko_lua", "pyright" }, -- ensure these servers are always installed
	-- 	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	-- 	ui = {
	-- 		icons = {
	-- 			server_installed = "✓",
	-- 			server_pending = "➜",
	-- 			server_uninstalled = "✗"
	-- 		}
	-- 	}
	-- })
	require'nvim-lsp-installer'.on_server_ready(function(server)
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

	use 'cohama/lexima.vim'
	use 'tpope/vim-surround'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-commentary'
	use 'christoomey/vim-tmux-navigator'
	vim.g.tmux_navigator_disable_when_zoomed = 1

	use {
		'vimwiki/vimwiki',
		config = function()
			local opts = {}
			if vim.fn.has('win32') == 1 then
				opts = { {
					path = '~/SynologyDrive/Personal/shkVimWiki/',
					path_html = '~/SynologyDrive/Personal/shkVimWikiHTM/',
					-- "C:\Users\shk\AppData\Local\nvim-data\site\pack\packer\start\vimwiki\autoload\vimwiki"
					template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/vimwiki/",
					-- syntax = "markdown", ext = ".md"
				} }
			elseif vim.fn.has('linux') == 1 then
				opts = { {
					path = '~/SynologyDrive/Personal/shkVimWiki/',
					path_html = '~/SynologyDrive/Personal/shkVimWikiHTM/',
					template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/vimwiki/",
					-- syntax = "markdown", ext = ".md"
				} }
			else opts = {} end
			vim.g.vimwiki_list = opts
			vim.g["vimwiki_global_ext"] = 0
		end
	}
	use {
	'goolord/alpha-nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
		local startify = require('alpha.themes.startify')
		startify.section.bottom_buttons.val = {
			startify.button("vn", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
			startify.button("vv", ".vimrc config", ":e ~/.vimrc<cr>"),
			startify.button("vq", "qt-config", ":e ~/.config/nvim/ginit.vim<cr>"),
			startify.button("vg", "goneovim config", ":e ~/.goneovim/settings.toml<cr>"),
			startify.button("va", "AutoHotKey Script", ":e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>"),
			startify.button("vw", "wezterm config", ":e C:/Users/shk/.config/wezterm/wezterm.lua <cr>"),
			startify.button("ai", "app installs quick note", ":e ~/app_installs.md<cr>"),
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
		ensure_installed = { "bash", "c", "cpp", "c_sharp", "lua", "css", "hjson", "help", "javascript", "java", "json", "latex", "markdown", "php", "python", "ruby", "tsx", "typescript", "vim", "markdown" },
		-- ensure_installed = "all",
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		}
	}
	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'tpope/vim-obsession'
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }
	use 'moll/vim-bbye'
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
