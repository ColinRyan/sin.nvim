local colors = require("sin.colors")
local util = require("sin.util")

local M = {}

--- Generate the theme for lazydocker
--- @param variant string: Variation of the colorscheme to use.
function M.generate(variant)
    local template = [==[
# yaml-language-server: $schema=https://json.schemastore.org/lazydocker.json
# sin theme for lazygit
gui:
    border: rounded # pending merge of https://github.com/jesseduffield/lazydocker/pull/529 🤞
    theme:
        activeBorderColor:
            - "${cyan}"
        inactiveBorderColor:
            - "${grey}"
        selectedLineBgColor:
            - "${bgHighlight}"
        optionsTextColor:
            - "${bgHighlight}"
]==]

    return util.parse_extra_template(template, colors[variant])
end

return M
