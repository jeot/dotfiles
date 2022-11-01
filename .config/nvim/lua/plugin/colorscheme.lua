vim.cmd [[
try

  colorscheme 256_noir
  colorscheme papercolor
  colorscheme tender
  colorscheme onedark
  colorscheme gruvbox
  colorscheme iceberg

  set background=light
  set background=dark

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

