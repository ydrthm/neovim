return {
    -- {
    --     "maxmx03/solarized.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     ---@type solarized.config
    --     opts = {
    --         transparent = {
    --             enabled = true,
    --             normalfloat = false,
    --             pmenu = false,
    --             lazy = false,
    --             mason = false,
    --         },
    --         styles = {
    --             enabled = false,
    --         },
    --     },
    --     config = function(_, opts)
    --         vim.o.background = "dark"
    --         require("solarized").setup(opts)
    --         vim.cmd.colorscheme("solarized")
    --     end,
    -- },
    {

        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    bold = false,
                    italic = false,
                    transparency = true,
                },
                highlight_groups = {
                    -- Base is the dark rose-pine background. 
                    -- You can also use "overlay" for a slightly lighter solid look.
                    NormalFloat = { bg = "base" },
                    FloatBorder = { bg = "base", fg = "muted" },

                    -- -- Optional: Make telescope/mason windows follow suit
                    -- TelescopeNormal = { bg = "base" },
                    -- TelescopeBorder = { bg = "base" },
                    -- This handles the Autocomplete Dropdown
                    Pmenu = { bg = "base" },             -- The main menu background
                    PmenuSel = { bg = "highlight_high", fg = "text" }, -- The selected item
                    PmenuSbar = { bg = "overlay" },      -- The scrollbar background
                    PmenuThumb = { bg = "muted" },       -- The scrollbar handle
                },
            })
            vim.cmd("colorscheme rose-pine")
        end

    },
    -- {
    --     "aliqyan-21/darkvoid.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('darkvoid').setup({
    --             transparent = true,
    --             glow = false,
    --             show_end_of_buffer = true,
    --
    --             colors = {
    --                 fg = "#c0c0c0",
    --                 bg = "#1c1c1c",
    --                 cursor = "#bdfe58",
    --                 line_nr = "#404040",
    --                 visual = "#303030",
    --                 comment = "#585858",
    --                 string = "#d1d1d1",
    --                 func = "#e1e1e1",
    --                 kw = "#f1f1f1",
    --                 identifier = "#b1b1b1",
    --                 type = "#a1a1a1",
    --                 type_builtin = "#c5c5c5", -- current
    --                 -- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
    --                 search_highlight = "#1bfd9c",
    --                 operator = "#1bfd9c",
    --                 bracket = "#e6e6e6",
    --                 preprocessor = "#4b8902",
    --                 bool = "#66b2b2",
    --                 constant = "#b2d8d8",
    --
    --                 -- enable or disable specific plugin highlights
    --                 plugins = {
    --                     gitsigns = true,
    --                     nvim_cmp = true,
    --                     treesitter = true,
    --                     nvimtree = true,
    --                     telescope = true,
    --                     lualine = true,
    --                     bufferline = true,
    --                     oil = true,
    --                     whichkey = true,
    --                     nvim_notify = true,
    --                 },
    --
    --                 -- gitsigns colors
    --                 added = "#baffc9",
    --                 changed = "#ffffba",
    --                 removed = "#ffb3ba",
    --
    --                 -- Pmenu colors
    --                 pmenu_bg = "#1c1c1c",
    --                 pmenu_sel_bg = "#1bfd9c",
    --                 pmenu_fg = "#c0c0c0",
    --
    --                 -- EndOfBuffer color
    --                 eob = "#3c3c3c",
    --
    --                 -- Telescope specific colors
    --                 border = "#585858",
    --                 title = "#bdfe58",
    --
    --                 -- bufferline specific colors
    --                 bufferline_selection = "#1bfd9c",
    --
    --                 -- LSP diagnostics colors
    --                 error = "#dea6a0",
    --                 warning = "#d6efd8",
    --                 hint = "#bedc74",
    --                 info = "#7fa1c3",
    --             },
    --         })
    --         -- vim.api.nvim_set_hl(0, "@keyword.conditional", { bold = false })
    --         vim.cmd("colorscheme darkvoid")
    --     end
    -- }
    -- { 
    --     'olivercederborg/poimandres.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('poimandres').setup {
    --             bold_vert_split = false, -- use bold vertical separators
    --             dim_nc_background = false, -- dim 'non-current' window backgrounds
    --             disable_background = true, -- disable background
    --             disable_float_background = false, -- disable background for floats
    --             disable_italics = false, -- disable italics
    --         }
    --     end,
    --
    --     -- optionally set the colorscheme within lazy config
    --     init = function()
    --         vim.cmd("colorscheme poimandres")
    --     end
    -- }
}
