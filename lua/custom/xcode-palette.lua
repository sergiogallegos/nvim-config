-- Xcode 27.0 Default (Light), extracted from the installed Apple theme.
-- Source: /Applications/Xcode.app/Contents/SharedFrameworks/DVTUserInterfaceKit.framework/Versions/A/Resources/FontAndColorThemes/Default (Light).xccolortheme
-- Syntax RGB values are rounded to 8-bit; background matches the Xcode editor.
-- Neovim captures approximate Xcode semantic categories across languages.
return {
    fg = "#000000",
    comment = "#5D6C79",
    doc_keyword = "#4A5560",
    keyword = "#9B2393",
    string = "#C41A16",
    number = "#1C00CF",
    character = "#1C00CF",
    type = "#1C464A",
    system_type = "#3900A0",
    identifier = "#326D74",
    system_identifier = "#6C36A9",
    declaration = "#0F68A0",
    type_declaration = "#0B4F79",
    macro = "#643820",
    attribute = "#815F03",
    url = "#0E0EFF",
    bg = "#FFFFFF",
    subtle = "#E8F2FF",
    selection = "#A4CDFF",
    border = "#D4D4D4",
    green = "#277E1E",
    warning = "#EFB759",
    markup_code = "#AA0D91",
    aside = "#775599",
    invisibles = "#CCCCCC",
    error = "#F74A4A",
    info = "#675FFF",
    hint = "#A482FF",
    diff = "#8E8E8E",
    -- ANSI slots are an adaptation; Xcode defines syntax roles, not ANSI slots.
    ansi = { "#000000", "#C41A16", "#326D74", "#815F03", "#0F68A0", "#9B2393", "#1C464A", "#5D6C79", "#5D6C79", "#F74A4A", "#1C464A", "#EFB759", "#0E0EFF", "#6C36A9", "#0B4F79", "#000000" },
}
