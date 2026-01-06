return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "query",
                "markdown",
            },
            auto_install = false,
            hightlight = { enable = true, },
        })
    end,
}
