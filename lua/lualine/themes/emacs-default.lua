-- Lualine companion for colors/emacs-default.lua.
-- Strong mode colors make editor state obvious while the rest stays quiet.
local colors = {
    bg = "#FFFFFF",
    fg = "#000000",
    subtle = "#F2F2F2",
    chrome = "#E5E5E5",
    muted = "#595959",
    blue = "#0000FF",
    green = "#1E7A1E",
    purple = "#A020F0",
    sienna = "#A0522D",
    red = "#C00000",
}

local section = {
    b = { fg = colors.fg, bg = colors.chrome },
    c = { fg = colors.fg, bg = colors.subtle },
}

return {
    normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    insert = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    visual = {
        a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    replace = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    command = {
        a = { fg = colors.bg, bg = colors.sienna, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    terminal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = section.b,
        c = section.c,
    },
    inactive = {
        a = { fg = colors.muted, bg = colors.subtle },
        b = { fg = colors.muted, bg = colors.subtle },
        c = { fg = colors.muted, bg = colors.bg },
    },
}
