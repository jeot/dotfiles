require('packer').startup(
function()
	use 'wbthomason/packer.nvim'
	use 'tomasr/molokai'
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
end)
