return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            "mason-org/mason.nvim",
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
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				lua_ls = {
					on_init = function(client)
						-- This makes Lua recognize 'vim' and Neovim APIs
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = { vim.env.VIMRUNTIME },
							},
						})
					end,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
                basedpyright = {
                    capabilities = {
                        offsetEncoding = {"utf-8"},
                    },
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "basic",
                                autoImportCompletions = true,
                                diagnosticMode = "openFilesOnly",
                                diagnosticSeverityOverrides = {
                                    reportUnusedImport = "none",
                                    reportUnusedVariable = "none",
                                    reportDuplicateImport = "none",
                                },
                            },
                        },
                    },
                },
				ruff = {},
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index", -- Index your project in the background
                        "--clang-tidy",      -- Enable the advanced linter
                        "--header-insertion=never", -- Stops it from automatically adding #include (can be annoying)
                    },
                },
                superhtml = {},
			}

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "lua-language-server",
                    "basedpyright",
                    "ruff",
                    "debugpy",
                    "clangd",
                    "codelldb",
                    "clang-format",
                    "superhtml",
                },
                auto_update = false,
                run_on_start = true,
            })

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			for name, opts in pairs(servers) do
				opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
            if not opts.capabilities.offsetEncoding then
                opts.capabilities.offsetEncoding = { "utf-8" }
            end
				vim.lsp.config(name, opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local opts = { buffer = args.buf }

                    local function map(mode, lhs, rhs, desc)
                        opts.desc = desc
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    map("n", "gd", function() vim.lsp.buf.definition() end, "Go to Definition")
                    map("n", "<leader>vd", function() vim.diagnostic.open_float() end, "Open Float Diagnostic")

                    -- If the client is Ruff, disable hover
                    if client and client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end

					-- Simple highlight logic
					-- if client and client:supports_method("textDocument/documentHighlight", args.buf) then
					-- 	local group = vim.api.nvim_create_augroup("lsp_highlight", { clear = false })
					--
					-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					-- 		buffer = args.buf,
					-- 		group = group,
					-- 		callback = vim.lsp.buf.document_highlight,
					-- 	})
					-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					-- 		buffer = args.buf,
					-- 		group = group,
					-- 		callback = vim.lsp.buf.clear_references,
					-- 	})
					-- end
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
			})
		end,
	},
}
