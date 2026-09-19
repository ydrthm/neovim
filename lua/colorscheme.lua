return {
    {
        "e-q/okcolors.nvim",
        name = "okcolors",
        config = function()
            require("okcolors").setup({
                variant = "sharp", -- "smooth" or "sharp", defaults to "smooth"
            })
            vim.cmd("colorscheme okcolors")

            local set_hl = vim.api.nvim_set_hl

            -- set_hl(0, "PreProc", { fg = "#9D00FF" })
            -- set_hl(0, "Statement", { fg = "#9D00FF" })
            -- set_hl(0, "Function", { fg = "#95a99f" })
            -- set_hl(0, "Type", { fg = "#22cde5" })

            set_hl(0, "PreProc", { fg = "#22cde5" })
            set_hl(0, "Statement", { fg = "#22cde5" })
            set_hl(0, "Function", { fg = "#96a6c8" })
            set_hl(0, "Type", { fg = "#95a99f" })
            set_hl(0, "Comment", { fg = "#ddb227" })
            set_hl(0, "Delimiter", { fg = "#CFCFCF" })
            set_hl(0, "Identifier", { fg = "#CFCFCF" })
            set_hl(0, "@punctuation.bracket", { fg = "#CFCFCF" })
            set_hl(0, "@number.c", { fg = "#CFCFCF" })
            set_hl(0, "Constant", { fg = "#CFCFCF" })
            set_hl(0, "@constant.builtin", { fg = "#CFCFCF" })
            set_hl(0, "@string.escape", { fg = "#19db69" })
            set_hl(0, "netrwDir", { fg = "#96a6c8" })

            set_hl(0, "MyNormalCursor", { fg = "#CFCFCF", bg = "#CFCFCF" })
            set_hl(0, "MyInsertCursor", { fg = "#CFCFCF", bg = "#CFCFCF" })
            set_hl(0, "CurSearch", { fg = "#000000", bg = "#ffffff" })

            --#9cb4fe
            --#95a99f
            --#96a6c8
            --#ddb227
            --#ff88d6
        end
    },
    -- {
    --     'ThunderBoltCODMYT/gruber-darker.vim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruber_transparent_bg = 1
    --         vim.g.gruber_bold_keywords = 0
    --         vim.g.gruber_italic_comments = 0
    --         vim.cmd('colorscheme gruber-darker')
    --
    --         local set_hl = vim.api.nvim_set_hl
    --
    --         -- set_hl(0, "Normal", { fg = "#e4e4ef", bg = "#181818" })
    --         -- set_hl(0, "Normal", { fg = "#e4e4ef", bg = "#000000" })
    --         -- set_hl(0, "Number", { fg = "#e4e4ef" })
    --         -- set_hl(0, "@module.javascript", { fg = "#e4e4ef" })
    --         -- set_hl(0, "Identifier", { fg = "#e4e4ef" })
    --         -- set_hl(0, "@variable", { fg = "#e4e4ef" })
    --         -- set_hl(0, "Constant", { fg = "#73c936" })
    --         -- set_hl(0, "@constant.macro.c", { fg = "#73c936" })
    --         -- set_hl(0, "@keyword.directive.define.c", { fg = "#95a99f" })
    --         -- set_hl(0, "@variable.builtin.javascript", { fg = "#9e95c7" })
    --         set_hl(0, "MyNormalCursor", { fg = "#e4e4ef", bg = "#e4e4ef" })
    --         set_hl(0, "MyInsertCursor", { fg = "#e4e4ef", bg = "#e4e4ef" })
    --         -- set_hl(0, "LineNr", { fg = "#52494e", bg = "#000000" })
    --         -- set_hl(0, "SignColumn", { bg = "#000000" })
    --         set_hl(0, "@function.builtin.lua", { fg = "#95a99f" })
    --         -- set_hl(0, "StatusLine", { bold = false, fg="#e4e4ef", bg="#282828" })
    --     end,
    -- }

    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({
    --             styles = {
    --                 bold = false,
    --                 italic = false,
    --                 transparency = false,
    --             },
    --             palette = {
    --                 _nc = "#16141f",
    --                 base = "#191724",
    --                 surface = "#1f1d2e",
    --                 overlay = "#26233a",
    --                 muted = "#6e6a86",
    --                 subtle = "#908caa",
    --                 text = "#e0def4",
    --                 love = "#eb6f92",
    --                 gold = "#f6c177",
    --                 rose = "#ebbcba",
    --                 pine = "#31748f",
    --                 foam = "#9ccfd8",
    --                 iris = "#c4a7e7",
    --                 leaf = "#95b1ac",
    --                 highlight_low = "#21202e",
    --                 highlight_med = "#403d52",
    --                 highlight_high = "#524f67",
    --                 none = "NONE",
    --             },
    --             highlight_groups = {
    --                 ["@function.method.call"] = { fg = "rose" },
    --                 ["@variable.parameter"] = { fg = "text" },
    --                 ["@punctuation.bracket"] = { fg = "text" },
    --                 ["@keyword.directive.define"] = { fg = "pine" },
    --                 ["@punctuation.delimiter"] = { fg = "text" },
    --                 ["@variable.member"] = { fg = "text" },
    --                 Operator = { fg = "text" },
    --                 Number = { fg = "iris" },
    --             },
    --         })
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },
}

