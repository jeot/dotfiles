vim.g['lightline'] = {
	colorscheme = 'iceberg', -- tender papercolor gruvbox 256_noir iceberg onedark nightfly
	-- separator = { left='', right= ''},
	-- subseparator = { left= '', right= ''},
	separator = { left='', right= ''},
	subseparator = { left= '', right= ''},
	active = {
		left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified',  'nvim_treesitter#statusline()'}},
		right = {{'filetype','fileencoding','percent','lineinfo'}}
	},
	inactive = {
		left = {{'filename'}}
	},
	tabline = {
		left = {{'buffers'}},
		right = {{'tabs'}}
	},
	component_expand = {
		buffers = 'lightline#bufferline#buffers',
		tabs = 'lightline#tabs'
	},
	component_type = {
		buffers = 'tabsel',
		tabs = 'tabsel',
	},
	tab = {
		active = {'tabnum'},
		inactive = {'tabnum'}
	}
}

vim.cmd [[
command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

call LightlineReload()
]]
