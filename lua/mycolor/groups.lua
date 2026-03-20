local M = {}

local colors = require("mycolor.palette")

function M.setup()
    return {
        --ui
        Normal = { fg = colors.text, bg = colors.base },
        StatusLine = { fg = colors.subtle, bg = colors.surface },
        ColorColumn = { bg = colors.surface },
        CursorLine = { bg = colors.hlLow },
    }
end

return M
