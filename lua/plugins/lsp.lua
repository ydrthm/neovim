return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
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
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
					},
				},
			},
			ts_ls = {
				filetypes = {
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
			},
			html = {},
            cssls = {},
		}

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		for name, opts in pairs(servers) do
			opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
			lspconfig[name].setup(opts)
		end

		local function lsp_keymaps(buf)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
			end

			map("n", "grn", vim.lsp.buf.rename, "Rename")
			map({ "n", "v" }, "gra", vim.lsp.buf.code_action, "Code Action")
			map("n", "K", vim.lsp.buf.hover, "Hover Docs")
			map("n", "<leader>d", function()
				vim.diagnostic.open_float({ border = "rounded" })
			end, "Line Diagnostics")
			map("n", "Fl", function()
				require("conform").format({ async = true })
			end, "Format")
			map("n", "grd", require("fzf-lua").lsp_definitions, "Goto Definition")
			map("n", "grr", require("fzf-lua").lsp_references, "References")
			map("n", "gri", require("fzf-lua").lsp_implementations, "Implementation")
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				lsp_keymaps(event.buf)

				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				-- Create augroups once
				local highlight_augroup = vim.api.nvim_create_augroup("UserLspHighlight", { clear = true })
				local detach_augroup = vim.api.nvim_create_augroup("UserLspDetach", { clear = true })

				-- Inside LspAttach
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						buffer = event.buf,
						group = detach_augroup,
						callback = function()
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event.buf })
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
}
