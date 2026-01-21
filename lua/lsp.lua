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
				clangd = {},
				pyright = {
					settings = {
						python = {
							analysis = {
								ignore = { "*" },
								typeCheckingMode = "basic",
							},
						},
					},
				},
				ruff = {},
			}

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			for name, opts in pairs(servers) do
				opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
				vim.lsp.config(name, opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					-- Simple highlight logic
					if client and client:supports_method("textDocument/documentHighlight", args.buf) then
						local group = vim.api.nvim_create_augroup("lsp_highlight", { clear = false })

						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = args.buf,
							group = group,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = args.buf,
							group = group,
							callback = vim.lsp.buf.clear_references,
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
}
