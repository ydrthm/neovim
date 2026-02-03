return { 
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            ts.install({ "lua", "python", "vim", "vimdoc", "markdown", "csv" })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    -- 1. Check if the current filetype actually has a Treesitter parser
                    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                    if not lang then
                        return
                    end -- If no language mapping, stop here

                    local has_parser, _ = pcall(vim.treesitter.get_parser, args.buf, lang)
                    if not has_parser then
                        return
                    end -- If parser isn't installed, stop here

                    -- 2. Only start if the parser exists
                    vim.treesitter.start(args.buf)
                end,
            })
        end
    }, 
    {
        "nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end
    },
}
