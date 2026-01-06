-- return {
--     "kdheepak/monochrome.nvim",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme monochrome")
--     end,
-- }
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }

-- return {
--     'olivercederborg/poimandres.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--          vim.cmd("colorscheme poimandres")
--     end,
-- }
--     "bluz71/vim-moonfly-colors",
--     name = "moonfly",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme moonfly")
--     end,
-- }
--

-- return {
--     {
--         "wnkz/monoglow.nvim",
--         lazy = false,
--         priority = 1000,
--         config = function()
--             vim.cmd([[colorscheme monoglow]])
--         end,
--     },
-- }

-- return {
--     "EdenEast/nightfox.nvim",
--     priority = 1000,
--     config = function()
--         vim.cmd([[colorscheme carbonfox]])
--     end,
-- }
-- {
--     'nvim-lualine/lualine.nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     config = function()
--         require('lualine').setup({
--             options = {
--                 theme = heya
--             }
--         })
--     end
-- }
-- }
--
--
return {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
        vim.o.background = "dark"
        require("solarized").setup(opts)
        vim.cmd.colorscheme("solarized")
    end,
}
