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

    }
}
