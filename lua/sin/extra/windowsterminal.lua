local colors = require("sin.colors")
local util = require("sin.util")

local M = {}

--- Generate sin theme for windows terminal.
--- @param variant string: Variation of the colorscheme to use.
function M.generate(variant)
    local template = [==[
{
    "background": "${bg}",
    "black": "${bg}",
    "blue": "${blue}",
    "brightBlack": "${bgHighlight}",
    "brightBlue": "${blue}",
    "brightCyan": "${cyan}",
    "brightGreen": "${green}",
    "brightPurple": "${purple}",
    "brightRed": "${red}",
    "brightWhite": "${fg}",
    "brightYellow": "${yellow}",
    "cursorColor": "${fg}",
    "cyan": "${cyan}",
    "foreground": "${fg}",
    "green": "${green}",
    "name": "sin",
    "purple": "${purple}",
    "red": "${red}",
    "selectionBackground": "${bgHighlight}",
    "white": "${fg}",
    "yellow": "${yellow}"
}
]==]

    return util.parse_extra_template(template, colors[variant])
end

return M
