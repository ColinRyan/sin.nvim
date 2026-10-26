local M = {}

M.get_theme = function()
    local colors = require("sin.colors").default
    local opts = require("sin.config").options

    if opts.theme.variant == "light" then
        colors = require("sin.colors").light
    end

    if opts.theme.variant == "auto" then
        if vim.o.background == "light" then
            colors = require("sin.colors").light
        end
    end

    if opts.transparent then
        colors.bg = "NONE"
    end

    local sin = {
        normal = {
            a = { fg = colors.blue, bg = colors.bg },
            b = { fg = colors.cyan, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
            x = { fg = colors.fg, bg = colors.bg },
            y = { fg = colors.magenta, bg = colors.bg },
            z = { fg = colors.grey, bg = colors.bg },
        },
        insert = {
            a = { fg = colors.green, bg = colors.bg },
            z = { fg = colors.grey, bg = colors.bg },
        },
        visual = {
            a = { fg = colors.magenta, bg = colors.bg },
            z = { fg = colors.grey, bg = colors.bg },
        },
        terminal = {
            a = { fg = colors.orange, bg = colors.bg },
            z = { fg = colors.grey, bg = colors.bg },
        },
    }

    return sin
end

return M
