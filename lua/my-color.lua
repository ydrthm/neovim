local M = {};

local colors = {
    bg = "#131417",
    fg = "#f1f7f7",
    red = "#cf2f23",
    green = "#29c42c",
    yellow = "#ffd356",
    blue = "#29419c",
    gray = "#3d3c3c",
    salmon = "#FF7E70",
    diff_add = "#1f3325",
	diff_change = "#262c36",
	diff_delete = "#3b2325",
    diff_text = "#388bfd",
}

--- Convenience `vim.api.nvim_set_hl()` wrapper
--- @param name string
--- @param val vim.api.keyset.highlight
local function hl(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

function M.colorscheme()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    vim.o.background = "dark";
    vim.g.theme_name = "my-color";

    hl("Added", { fg = colors.green })
    hl("Change", { fg = colors.yellow })
    hl("Remove", { fg = colors.red })
    hl("Normal", { fg = colors.fg, bg = colors.bg })
    hl("String", { fg = colors.salmon })
    hl("Special", { fg = colors.salmon })
    hl("@lsp.typemod.function.declaration", { fg = colors.yellow })
    hl("@lsp.typemod.variable.declaration", { fg = colors.blue })

    -- Standard Syntax (The "Plain" Base)
    hl("Boolean", { fg = colors.fg })
    hl("Character", { fg = colors.fg })
    hl("Conditional", { fg = colors.fg })
    hl("Constant", { fg = colors.fg })
    hl("Debug", { fg = colors.fg })
    hl("Define", { fg = colors.fg })
    hl("Delimiter", { fg = colors.fg })
    hl("Exception", { fg = colors.fg })
    hl("Float", { fg = colors.fg })
    hl("Function", { fg = colors.fg })
    hl("Identifier", { fg = colors.fg })
    hl("Include", { fg = colors.fg })
    hl("Label", { fg = colors.fg })
    hl("Macro", { fg = colors.fg })
    hl("Number", { fg = colors.fg })
    hl("Operator", { fg = colors.fg })
    hl("PreCondit", { fg = colors.fg })
    hl("PreProc", { fg = colors.fg })
    hl("Repeat", { fg = colors.fg })
    hl("Special", { fg = colors.fg })
    hl("SpecialChar", { fg = colors.fg })
    hl("SpecialKey", { fg = colors.fg })
    hl("Statement", { fg = colors.fg })
    hl("StorageClass", { fg = colors.fg })
    hl("Structure", { fg = colors.fg })
    hl("Tag", { fg = colors.fg })
    hl("Type", { fg = colors.fg })
    hl("Typedef", { fg = colors.fg })


end

return M
