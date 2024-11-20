local wezterm = require 'wezterm'
local config = {}

config.colors = {
  foreground = "#9CC2C3",
  background = "#001E27",
  cursor_bg = "#F34B00",
  cursor_fg = 'black',
  selection_fg = 'white',
  selection_bg = "#003748",

  ansi = {
    "#002831", --black
    "#D11C24", --red
    "#6CBE6C", --green
    "#A57706", --yellow
    "#2176C7", --blue
    "#C61C6F", --magenta
    "#259286", --cyan
    "#EAE3CB", --white
  },
  brights = {
    "#006488",
    "#F5163B",
    "#51EF84",
    "#B27E28",
    "#178EC8",
    "#E24D8E",
    "#00B39E",
    "#FCF4DC",
  }
}

config.font = wezterm.font("Hackgen Console NF", {weight="Regular", stretch="Normal", style="Normal"})

return config
