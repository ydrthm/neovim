vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and
            (kind == "install" or kind == "update")
        then
            if not ev.data.active then
                vim.cmd.packadd('nvim-treesitter')
            end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }

require("nvim-treesitter").setup()
require("nvim-treesitter").install({
    "lua",
    "vim",
    "vimdoc",
    "c",
    "javascript",
    "html",
    "css",
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "javascript",
        "html",
        "css",
    },
    callback = function() vim.treesitter.start() end,
})
