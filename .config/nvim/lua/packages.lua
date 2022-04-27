require('packer').startup(
function()
	use 'wbthomason/packer.nvim'
	-- use 'tomasr/molokai'
	use 'sainnhe/gruvbox-material'
	use {
	'vimwiki/vimwiki',
	config = function()
		vim.g.vimwiki_list = {
		{
			path = '~/my_site/',
			path_html = '~/my_site_html'
		}
		}
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
end)
