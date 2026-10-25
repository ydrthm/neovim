local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "L3MON4D3/LuaSnip" and (kind == "install" or kind == "update") then
        vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
    end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
    {
        src = "https://github.com/L3MON4D3/LuaSnip",
        version = vim.version.range("v2.*")
    },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-N>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-P>", function() ls.jump(-1) end, { silent = true })
