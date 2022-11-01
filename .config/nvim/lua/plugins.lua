local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function()
	-- use "tweekmonster/startuptime.vim"

	use 'wbthomason/packer.nvim'
	use 'nvim-lua/popup.nvim'

	-- colorscheme
	use 'rafi/awesome-vim-colorschemes'
	use 'itchyny/lightline.vim'
	use 'mengelbrecht/lightline-bufferline'
	use 'PeterRincker/vim-searchlight'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

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
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'cohama/lexima.vim'
	use 'tpope/vim-surround'
	use 'tpope/vim-unimpaired'
	-- use 'tpope/vim-commentary'
	use 'numToStr/Comment.nvim'
	-- use 'christoomey/vim-tmux-navigator'
	-- vim.g.tmux_navigator_disable_when_zoomed = 1

	-- wiki
	use {
		'vimwiki/vimwiki',
		config = function()
			local opts = {}
			if vim.fn.has('win32') == 1 then
				opts = { {
					path = '~/SynologyDrive/Personal/Awesome/',
					path_html = '~/SynologyDrive/Personal/AwesomeHTML/',
					template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/vimwiki/",
					syntax = "markdown", ext = ".md"
				} }
			elseif vim.fn.has('linux') == 1 then
				opts = { {
					path = '~/SynologyDrive/Personal/Awesome/',
					path_html = '~/SynologyDrive/Personal/AwesomeHTML/',
					template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/vimwiki/",
					syntax = "markdown", ext = ".md"
				} }
			else opts = {} end
			vim.g.vimwiki_list = opts
			vim.g["vimwiki_global_ext"] = 0
		end
	}

	-- start screen
	-- use "mhinz/vim-startify"

	-- use {
	-- 'goolord/alpha-nvim',
	-- requires = { 'kyazdani42/nvim-web-devicons' },
	-- config = function ()
	-- 	require'alpha'.setup(require'alpha.themes.startify'.config)
	-- 	local startify = require('alpha.themes.startify')
	-- 	startify.section.bottom_buttons.val = {
	-- 		startify.button("vn", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
	-- 		startify.button("vv", ".vimrc config", ":e ~/.vimrc<cr>"),
	-- 		startify.button("vq", "qt-config", ":e ~/.config/nvim/ginit.vim<cr>"),
	-- 		startify.button("vg", "goneovim config", ":e ~/.goneovim/settings.toml<cr>"),
	-- 		startify.button("va", "AutoHotKey Script", ":e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>"),
	-- 		startify.button("vA", "Alacritty config", ":e C:/Users/shk/AppData/Roaming/alacritty/alacritty.yml<cr>"),
	-- 		startify.button("vw", "wezterm config", ":e C:/Users/shk/.config/wezterm/wezterm.lua <cr>"),
	-- 		startify.button("ai", "app installs quick note", ":e ~/app_installs.md<cr>"),
	-- 		startify.button("q", "quit nvim", ":qa<cr>")
	-- 	}
	-- 	vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', { noremap = true })
	-- end
	-- }

	-- IDE
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	require 'nvim-treesitter.install'.compilers = { "gcc" }
	require'nvim-treesitter.configs'.setup {
		-- ensure_installed = { "bash","c","cpp","c_sharp","lua","css","help","json","markdown","python","markdown" },
		incremental_selection = {
			enable = true,
			disable = function(lang, bufnr) -- Disable in large files
		        return lang == "vim" or vim.api.nvim_buf_line_count(bufnr) > 50000
			end,
			keymaps = {
				init_selection = 'v<CR>',
				node_incremental = '<CR>',
				scope_incremental = '<TAB>',
				node_decremental = '<S-TAB>',
			},
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		}
	}
	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
	use 'moll/vim-bbye'

	use 'lewis6991/impatient.nvim'
	require('impatient')

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
