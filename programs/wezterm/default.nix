{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = # lua
      ''
        local wezterm = require("wezterm")

        return {
        	color_scheme = "Gruvbox Material (Gogh)",
        	enable_wayland = false,-- Unfortunately broken on Hyprland, AGAIN
        	font = wezterm.font("FantasqueSansM Nerd Font"),
        	font_size = 13,
        	hide_tab_bar_if_only_one_tab = true,
        	hide_mouse_cursor_when_typing = false,
        	window_background_opacity = 1,
        	window_padding = {
        		left = 18,
        		right = 18,
        		top = 18,
        		bottom = 18,
        	},
        	colors = {
        	  cursor_bg='#d16526',
        	  cursor_fg='#ffffff',
        	},
        }
      '';
  };
}
