require('keybindings')
require('packages')
require('config')


vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- this is a cool function
local function greeting()
	print "hello world"
end


-- greeting()
