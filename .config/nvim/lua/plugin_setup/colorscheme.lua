-- settings for sainnhe/gruvbox-material
-- vim.g.gruvbox_material_background = 'medium'
-- vim.g.gruvbox_material_better_performance = 1
-- vim.cmd [[colorscheme gruvbox-material]]

-- settings for lunarvim/darkplus.nvim
vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
