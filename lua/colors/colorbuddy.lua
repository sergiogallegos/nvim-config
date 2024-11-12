-- lua/colors/my-colorscheme-name.lua

local colorbuddy = require("colorbuddy")

-- Set up your custom colorscheme
colorbuddy.colorscheme("my-colorscheme-name")

-- Define Colorbuddy components
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- Define colors
Color.new("background", "#282c34")
Color.new("red", "#cc6666")
Color.new("green", "#99cc99")
Color.new("yellow", "#f0c674")

-- Define highlight groups
Group.new("Function", colors.yellow, colors.background, styles.bold)
Group.new("luaFunctionCall", groups.Function, groups.Function, groups.Function)
Group.new("Error", colors.red:light(), nil, styles.bold)

-- Define custom style groups
Group.new("italicBoldFunction", colors.green, groups.Function, styles.bold + styles.italic)
Group.new("boldFunction", colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
