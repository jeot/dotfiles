-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  filters = {
	dotfiles = true,
	custom = {},
	exclude = {},
  },
  git = {
	enable = false,
	ignore = true,
	timeout = 400,
  },
  view = {
	width = 30,
	height = 30,
	hide_root_folder = false,
	side = "left",
	preserve_window_proportions = false,
	number = false,
	relativenumber = false,
	signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = { "l", "<CR>", "o" }, action = "edit" },
      },
    },
  }
}
