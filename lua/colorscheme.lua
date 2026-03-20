return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },
                palette = {
                    _nc = "#16141f",
                    base = "#191724",
                    surface = "#1f1d2e",
                    overlay = "#26233a",
                    muted = "#6e6a86",
                    subtle = "#908caa",
                    text = "#e0def4",
                    love = "#eb6f92",
                    gold = "#f6c177",
                    rose = "#ebbcba",
                    pine = "#31748f",
                    foam = "#9ccfd8",
                    iris = "#c4a7e7",
                    leaf = "#95b1ac",
                    highlight_low = "#21202e",
                    highlight_med = "#403d52",
                    highlight_high = "#524f67",
                    none = "NONE",
                },
                highlight_groups = {
                    Function = { fg = "NONE" },
                    Macro = { fg = "NONE" },
                    Operator = { fg = "NONE" },
                    Number = { fg = "NONE" },
                    Constant = { fg = "NONE" },
                    Include = { fg = "NONE" },
                    Boolean = { fg = "NONE" },
                    Label = { fg = "#31748f" },

                    ["@function"] = { fg = "NONE" },
                    ["@function.builtin"] = { fg = "NONE" },
                    ["@function.method"] = { fg = "NONE" },
                    ["@function.method.call"] = { fg = "NONE" },

                    ["@parameter"] = { fg = "NONE" },
                    ["@variable.parameter"] = { fg = "NONE" },
                    ["@variable.parameter.builtin"] = { fg = "NONE" },
                    ["@variable.builtin"] = { fg = "NONE" },
                    ["@variable.member"] = { fg = "NONE" },

                    ["@constant.macro"] = { fg = "NONE" },

                    ["@property"] = { fg = "NONE" },
                    ["@constructor"] = { fg = "NONE" },

                    ["@punctuation.delimiter"] = { fg = "NONE" },
                    ["@punctuation.bracket"] = { fg = "NONE" },
                    ["@punctuation.special"] = { fg = "NONE" },

                    BlinkCmpKindTypeParameter = { fg = "NONE" },
                },
            })
            vim.cmd("colorscheme rose-pine")
        end
    },
}

