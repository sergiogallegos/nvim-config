local c = require "custom.xcode-palette"
local function mode(color)
    return {
        a = { fg = color, bg = c.subtle, gui = "bold" },
        b = { fg = c.fg, bg = c.bg },
        c = { fg = c.fg, bg = c.bg },
    }
end
return {
    normal = mode(c.declaration),
    insert = mode(c.green),
    visual = mode(c.keyword),
    replace = mode(c.string),
    command = mode(c.macro),
    terminal = mode(c.identifier),
    inactive = mode(c.comment),
}
