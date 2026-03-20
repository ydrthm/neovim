local M = {}

local function apply()
    local groups = require("mycolor.groups").setup()

    for group, setting in pairs(groups) do
        vim.api.nvim_set_hl(0, group, setting)
    end
end

function M.load()
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    if vim.g.colors_name then
        vim.cmd("highlight clear")
    end

    vim.o.background = "dark"
    vim.g.colors_name = "mycolor"

    apply()
end


return M
