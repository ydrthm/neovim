vim.pack.add({
    {
        src = 'https://github.com/vieitesss/miniharp.nvim',
        version = vim.version.range("v*"), -- latest stable release
    },
})

require("miniharp").setup()

local miniharp = require('miniharp')

vim.keymap.set('n', '<leader>a', miniharp.toggle_file, { desc = 'miniharp: toggle file mark' })
vim.keymap.set('n', '<C-n>',     miniharp.next,        { desc = 'miniharp: next file mark' })
vim.keymap.set('n', '<C-p>',     miniharp.prev,        { desc = 'miniharp: prev file mark' })
vim.keymap.set('n', '<leader>h', miniharp.show_list,   { desc = 'miniharp: toggle marks list' })

vim.keymap.set('n', '<C-h>', function() miniharp.go_to(1) end, { desc = 'miniharp: go to mark 1' })
vim.keymap.set('n', '<C-j>', function() miniharp.go_to(2) end, { desc = 'miniharp: go to mark 2' })
vim.keymap.set('n', '<C-s>', function() miniharp.go_to(3) end, { desc = 'miniharp: go to mark 3' })
vim.keymap.set('n', '<C-e>', function() miniharp.go_to(4) end, { desc = 'miniharp: go to mark 4' })
