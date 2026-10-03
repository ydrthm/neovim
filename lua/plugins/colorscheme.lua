vim.pack.add({ "https://github.com/e-q/okcolors.nvim" })

require("okcolors").setup({
    variant = "sharp", -- "smooth" or "sharp", defaults to "smooth"
})
vim.cmd("colorscheme okcolors")

local set_hl = vim.api.nvim_set_hl

-- set_hl(0, "PreProc", { fg = "#9b4bcc" })
-- set_hl(0, "Statement", { fg = "#9b4bcc" })
-- set_hl(0, "Function", { fg = "#95a99f" })
-- set_hl(0, "Type", { fg = "#22cde5" })

set_hl(0, "PreProc", { fg = "#22cde5" })
set_hl(0, "Statement", { fg = "#22cde5" })
set_hl(0, "Comment", { fg = "#545454" })
set_hl(0, "Delimiter", { fg = "#D4D4D4" })
set_hl(0, "Identifier", { fg = "#D4D4D4" })
set_hl(0, "Function", { fg = "#96a6c8" })
set_hl(0, "Type", { fg = "#95a99f" })
set_hl(0, "@punctuation.bracket", { fg = "#D4D4D4" })
set_hl(0, "@number.c", { fg = "#D4D4D4" })
set_hl(0, "Constant", { fg = "#D4D4D4" })
set_hl(0, "@constant.builtin", { fg = "#D4D4D4" })
set_hl(0, "@string.escape", { fg = "#19db69" })
set_hl(0, "netrwDir", { fg = "#96a6c8" })

set_hl(0, "MyNormalCursor", { fg = "#D4D4D4", bg = "#D4D4D4" })
set_hl(0, "MyInsertCursor", { fg = "#D4D4D4", bg = "#D4D4D4" })
set_hl(0, "CurSearch", { fg = "#000000", bg = "#ffffff" })

--#9cb4fe
--#95a99f
--#96a6c8
--#ddb227
--#ff88d6
