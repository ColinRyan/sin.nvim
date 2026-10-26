
local palettes = require("sin.colors")
local colors = palettes.default
local opts = require("sin.config").options

-- sin.colors has no light palette yet; fall back to default instead of
-- crashing on nil when SinToggleMode switches to the light variant.
local light = palettes.light or palettes.default

if opts.theme.variant == "light" then
    colors = light
end

if opts.theme.variant == "auto" then
    if vim.o.background == "light" then
        colors = light
    end
end


if opts.transparent then
    colors.bg = "NONE"
end

local sin = {
    normal = {
        a = { fg = colors.highlight, bg = colors.bg },
        b = { fg = colors.cyan, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.magenta, bg = colors.bg },
        z = { fg = colors.syntax, bg = colors.bg },
    },
    insert = {
        a = { fg = colors.add, bg = colors.bg },
        z = { fg = colors.syntax, bg = colors.bg },
    },
    visual = {
        a = { fg = colors.magenta, bg = colors.bg },
        z = { fg = colors.syntax, bg = colors.bg },
    },
    terminal = {
        a = { fg = colors.orange, bg = colors.bg },
        z = { fg = colors.syntax, bg = colors.bg },
    },
}

return sin
