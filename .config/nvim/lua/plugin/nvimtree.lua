local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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
	filesystem_watchers = {
		enable = true,
		debounce_delay = 200,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	view = {
		width = 30,
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
				{ key = "l", action = "preview" },
				{ key = { "<CR>", "o" }, action = "edit" },
				{ key = "u", action = "dir_up" },
				{ key = "'", action = "close_node" },
				{ key = '"', action = "collapse_all" },
				{ key = "?", action = "toggle_help" },
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},
}
