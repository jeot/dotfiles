local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print "mason did not load correctly!"
  return
end
local status_ok, masonlspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print "mason-lspconfig did not load correctly!"
  return
end

mason.setup()
masonlspconfig.setup()

-- run clangd lsp
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
require'lspconfig'.clangd.setup{}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
require'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim', 'use'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
