local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup {
	options = {
    icons_enabled = true,
    theme = 'iceberg',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {{'filename', symbols = {readonly = ''}}},
    lualine_x = {'encoding', 'fileformat', {'filetype', colored=true, icon_only=false, icon={align='right'}}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', symbols = { readonly = ''}}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
		lualine_a = {{'buffers', mode = 0, symbols = {
        modified = ' +',      -- Text to show when the buffer is modified
        alternate_file = '', -- Text to show to identify the alternate file
        directory =  '',     -- Text to show when the buffer is a directory
      },}},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}
