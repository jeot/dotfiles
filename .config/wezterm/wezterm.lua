local wezterm = require 'wezterm';

wezterm.on("update-right-status", function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M ");
  local bat = ""
  for _, b in ipairs(wezterm.battery_info()) do
    bat = "🔋 " .. string.format("%.0f%%", b.state_of_charge * 100)
  end
  window:set_right_status(wezterm.format({
    {Text=bat .. "   "..date},
  }));
end)


return {
	-- font = wezterm.font("JetBrains Mono"), font_size = 11.0,
	-- font = wezterm.font("UbuntuMono NF"), font_size = 13.0,
	font = wezterm.font("mononoki Nerd Font Mono"), font_size = 12.0,
	harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- ... == === => ==> -> -< != !== /= /==
	color_scheme = "Monokai Remastered",
	window_decorations = "RESIZE",
	window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
	use_fancy_tab_bar = true,
	inactive_pane_hsb = { saturation = 0.8, brightness = 0.8, },
	-- timeout_milliseconds defaults to 1000 and can be omitted
	leader = { key=" ", mods="CTRL", timeout_milliseconds=3000 },
	keys = {
		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		-- {key=" ", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"}},
		-- pane and tabs
		{key="|", mods="LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
		{key="_", mods="LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
		{key="\\", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
		{key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
		{key="d", mods="CTRL", action=wezterm.action{CloseCurrentPane={confirm=false}}},
		-- {key="h", mods="CTRL", action="Hide"},
		{key=">", mods="LEADER|SHIFT", action=wezterm.action{MoveTabRelative=1}},
		{key="<", mods="LEADER|SHIFT", action=wezterm.action{MoveTabRelative=-1}},
		{key="t", mods="SHIFT|ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
		{key="c", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
		{key=" ", mods="LEADER|CTRL", action="ActivateLastTab"},
		{key="h", mods="SHIFT|ALT", action=wezterm.action{ActivateTabRelative=-1}},
		{key="l", mods="SHIFT|ALT", action=wezterm.action{ActivateTabRelative=1}},
		-- selecting pane
		{ key = "LeftArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
		{ key = "RightArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
		{ key = "UpArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
		{ key = "DownArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
		{ key = "h", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
		{ key = "l", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
		{ key = "k", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
		{ key = "j", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
		{ key = "h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
		{ key = "l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
		{ key = "k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
		{ key = "j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},

		-- LEADER, followed by 'r' will put us in resize-pane
		-- mode until we cancel that mode.
		{key="r", mods="LEADER", action=wezterm.action{ ActivateKeyTable={ name="resize_pane", one_shot=false, }}},

    -- LEADER, followed by 'a' will put us in activate-pane
    -- mode until we press some other key or until 1 second (1000ms)
    -- of time elapses
		{key="a", mods="LEADER", action=wezterm.action{ ActivateKeyTable={ name="activate_pane", timeout_milliseconds=3000, }}},
	},
	key_tables = {
		-- Defines the keys that are active in our resize-pane mode.
		-- Since we're likely to want to make multiple adjustments,
		-- we made the activation one_shot=false. We therefore need
		-- to define a key assignment for getting out of this mode.
		-- 'resize_pane' here corresponds to the name="resize_pane" in
		-- the key assignments above.
		resize_pane = {
		  {key="LeftArrow", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
		  {key="h", action=wezterm.action{AdjustPaneSize={"Left", 1}}},

		  {key="RightArrow", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
		  {key="l", action=wezterm.action{AdjustPaneSize={"Right", 1}}},

		  {key="UpArrow", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
		  {key="k", action=wezterm.action{AdjustPaneSize={"Up", 1}}},

		  {key="DownArrow", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
		  {key="j", action=wezterm.action{AdjustPaneSize={"Down", 1}}},

		  -- Cancel the mode by pressing escape
		  {key="Escape", action="PopKeyTable"},

		},

		-- Defines the keys that are active in our activate-pane mode.
		-- 'activate_pane' here corresponds to the name="activate_pane" in
		-- the key assignments above.
		activate_pane = {
		  {key="LeftArrow", action=wezterm.action{ActivatePaneDirection="Left"}},
		  {key="h", action=wezterm.action{ActivatePaneDirection="Left"}},

		  {key="RightArrow", action=wezterm.action{ActivatePaneDirection="Right"}},
		  {key="l", action=wezterm.action{ActivatePaneDirection="Right"}},

		  {key="UpArrow", action=wezterm.action{ActivatePaneDirection="Up"}},
		  {key="k", action=wezterm.action{ActivatePaneDirection="Up"}},

		  {key="DownArrow", action=wezterm.action{ActivatePaneDirection="Down"}},
		  {key="j", action=wezterm.action{ActivatePaneDirection="Down"}},
		},
	}
}
