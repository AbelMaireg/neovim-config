local config = require ("nvconfig").ui.statusline
local sep_style = config.separator_style
local utils = require ("nvchad.stl.utils")

sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block"
    or sep_style

local sep_icons = utils.separators
local separators = (type (sep_style) == "table" and sep_style)
    or sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

return function (icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
    return sep_l_hlgroup
        .. sep_l
        .. iconHl_group
        .. icon
        .. " "
        .. txt_hl_group
        .. " "
        .. txt
        .. sep_r
end
