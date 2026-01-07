return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {
                "saghen/blink.cmp",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
                version = "1.*",
                opts = {
                    keymap = { preset = "default" },
                    appearance = {
                        nerd_font_variant = "mono",
                    },
                    completion = { documentation = { auto_show = false } },
                    sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                    },
                    fuzzy = { implementation = "prefer_rust_with_warning" },
                },
                opts_extend = { "sources.default" },
            },
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                        },
                    },
                },
                clangd = {},
            }

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for name, opts in pairs(servers) do
                opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
                vim.lsp.config(name, opts)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("my.lsp", {}),
                callback = function(args)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
                    end

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

                    -- Find references for the word under your cursor.
                    map("grr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map("gri", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-t>.
                    map("grd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map("gW", require("fzf-lua").lsp_workspace_symbols, "Open Workspace Symbols")

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map("grt", require("fzf-lua").lsp_typedefs, "[G]oto [T]ype Definition")

                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if not client then
                        return
                    end
                    -- Auto-format ("lint") on save.
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if
                        not client:supports_method("textDocument/willSaveWaitUntil")
                        and client:supports_method("textDocument/formatting")
                    then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end

                    local function client_supports_method(lsp_client, method, bufnr)
                        if vim.fn.has("nvim-0.11") == 1 then
                            return lsp_client:supports_method(method, bufnr)
                        else
                            return lsp_client.supports_method(method, { bufnr = bufnr })
                        end
                    end

                    -- Create augroups once
                    local highlight_augroup = vim.api.nvim_create_augroup("UserLspHighlight", { clear = true })
                    local detach_augroup = vim.api.nvim_create_augroup("UserLspDetach", { clear = true })

                    -- Inside LspAttach
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            args.buf
                        )
                    then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = args.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = args.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            buffer = args.buf,
                            group = detach_augroup,
                            callback = function()
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = args.buf })
                            end,
                        })
                    end
                end,
            })

            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
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
                hightlight = { enable = true },
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        events = { "BufReadPre", "BufNewFile" },
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua", lsp_format = "fallback" },
                },
            })
        end,

        vim.keymap.set("n", "Fl", function()
            require("conform").format()
        end, { desc = "Format Language/Code" }),
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {}

            local function try_linting()
                local linters = lint.linters_by_ft[vim.bo.filetype]

                lint.try_lint(linters)
            end

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    try_linting()
                end,
            })

            vim.keymap.set("n", "<leader>gl", function()
                try_linting()
            end, { desc = "Trigger linting for current file" })
        end,
    },
}
