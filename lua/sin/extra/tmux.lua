local colors = require("sin.colors")
local util = require("sin.util")

local M = {}

--- Generate sin theme for tmux.
--- @param variant string: Variation of the colorscheme to use.
function M.generate(variant)
    local template = [==[
# sin theme for tmux (catppuccin)
thm_bg="${bgAlt}"
thm_fg="${fg}"
thm_cyan="${cyan}"
thm_black="${bgHighlight}"
thm_gray="${bgHighlight}"
thm_magenta="${magenta}"
thm_pink="${pink}"
thm_red="${red}"
thm_green="${green}"
thm_yellow="${yellow}"
thm_blue="${blue}"
thm_orange="${orange}"
thm_black4="${grey}"
]==]

    return util.parse_extra_template(template, colors[variant])
end

return M
