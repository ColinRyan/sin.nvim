local theme = require("sin.theme")
local config = require("sin.config")
local util = require("sin.util")

local M = {}

function M.load()
    util.load(theme.setup())
end

M.setup = config.setup

M.colorscheme = M.load

vim.api.nvim_create_user_command("SinToggleMode", function()
    local new_variant = util.toggle_theme_variant()
    util.toggle_lualine_theme()
    vim.api.nvim_exec_autocmds("User", { pattern = "SinToggleMode", data = new_variant })
end, {})

-- autocmd runs togle_lualine_theme when background option is changed. checks if the colorscheme is 'sin' and the variant is 'auto' before executing.
vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
        if vim.g.sin_opts.theme.variant ~= "auto" or vim.fn.execute("colorscheme"):find("sin") == nil then
            return
        end
        util.toggle_lualine_theme()
    end,
})

return M
