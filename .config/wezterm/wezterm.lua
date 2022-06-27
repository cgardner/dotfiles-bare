local wezterm = require 'wezterm';

wezterm.on("update-right-status", function(window, _)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M ");

  window:set_right_status(wezterm.format({
    {Text=wezterm.nerdfonts.mdi_clock .. " "..date},
  }));
end)

return {
  font = wezterm.font("FiraCode Nerd Font"),
  color_scheme = "Gruvbox Dark",
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  enable_scroll_bar = false,
  enable_tab_bar = false,
  send_composed_key_when_right_alt_is_pressed=true,
}
