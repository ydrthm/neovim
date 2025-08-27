vim.g.python3_host_prog = '/usr/bin/python3'

require("configs.options")
require("configs.keymaps")
require("edlazy")

vim.cmd[[hi @function.builtin guifg=#f23e76]]
-- vim.cmd[[hi @variable.builtin guifg=#fa80a6]]

--#eb6f92
--#f6708

-- vim.cmd(":hi statusline guibg=NONE")
