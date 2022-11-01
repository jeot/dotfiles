require('plugins')
require('options')
require('keymaps')
require('config')
require('plugin/lualine')
require('plugin/comment')
require('plugin/nvimtree')
require('plugin/telescope')
require('plugin/colorscheme')
require('plugin/cmp')
require('plugin/mason')

-- vhdl tree-sitter test:
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vhdl = {
  install_info = {
    url = "~/publics/tree-sitter-vhdl", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "vhdl", -- if filetype does not match the parser name
}

-- ~/.config/nvim/ftplugin/vhdl.vim
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

vim.cmd [[
highlight link Searchlight WildMenu
]]

-- this is a cool function
-- local function greeting()
-- 	print "hello world"
-- end
-- greeting()


