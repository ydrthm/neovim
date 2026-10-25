-- vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
-- require('vague').setup({
--     transparent = false, -- If true, background is not set
--     bold = false,        -- Disable bold globally
--     italic = false,      -- Disable italic globally
--     colors = {
--         bg = '#141415',
--         inactiveBg = '#1c1c24',
--         fg = '#cdcdcd',
--         floatBorder = '#878787',
--         line = '#252530',
--         comment = '#606079',
--         builtin = '#b4d4cf',
--         func = '#c48282',
--         string = '#e8b589',
--         number = '#e0a363',
--         property = '#c3c3d5',
--         constant = '#aeaed1',
--         parameter = '#bb9dbd',
--         visual = '#333738',
--         error = '#d8647e',
--         warning = '#f3be7c',
--         hint = '#7e98e8',
--         operator = '#90a0b5',
--         keyword = '#6e94b2',
--         type = '#9bb4bc',
--         search = '#405065',
--         plus = '#7fa563',
--         delta = '#f3be7c',
--     },
-- })
-- vim.cmd.colorscheme('vague')
--
-- local set_hl = vim.api.nvim_set_hl
--
-- set_hl(0, "@function.call", { link = "@function" })
-- set_hl(0, "Number", { link = "@variable" })
-- set_hl(0, "SpecialChar", { link = "String" })
-- set_hl(0, "Operator", { link = "@variable" })
-- set_hl(0, "@variable.parameter", { link = "@variable" })
-- set_hl(0, "Constant", { link = "@variable" })
-- set_hl(0, "@variable.member", { link = "@variable" })
-- set_hl(0, "@function.method.call", { link = "@function" })
-- set_hl(0, "@property", { link = "@variable" })
-- -- set_hl(0, "Normal", { bg = "#000000" })
-- -- set_hl(0, "Function", { link = "@variable" })
-- set_hl(0, "@type.builtin", { link = "Type" })
-- set_hl(0, "StorageClass", { link = "Type" })
-- set_hl(0, "Typedef", { link = "Type" })
-- set_hl(0, "Structure", { link = "Type" })

vim.pack.add({ "https://github.com/phha/zenburn.nvim" })
vim.cmd.colorscheme("zenburn")

local set_hl = vim.api.nvim_set_hl
set_hl(0, "Visual", { bg = "#595757" })
set_hl(0, "Constant", { link = "@variable" })
set_hl(0, "Operator", { link = "@variable" })
set_hl(0, "SpecialChar", { link = "String" })
set_hl(0, "Character", { link = "String" })
set_hl(0, "Keyword", { fg = "#f0dfaf", bold = false })
-- set_hl(0, "Function", { fg = "#E9E9A8", bold = false })
set_hl(0, "Number", { link = "@variable" })
set_hl(0, "Delimiter", { link = "@variable" })
set_hl(0, "ErrorMsg", { link = "Error" })
-- set_hl(0, "Type", { link = "Special" })
set_hl(0, "StatusLine", { bg = "#2f2f2f" })
set_hl(0, "DiagnosticUnnecessary", { link = "@variable" })
set_hl(0, "MatchParen", { bg = "#595757", bold = true })
