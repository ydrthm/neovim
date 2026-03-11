return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("nvim-dap-virtual-text").setup({ commented = true })
			require("dap-python").setup("python3")
			require("dap-python").setup(
				vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			)

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- Change this path if your mason package is in a different location
                    command = vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/bin/codelldb",
                    args = {"--port", "${port}"},
                }
            }
            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    -- This path is standard for Mason installations on Linux/macOS
                    args = {
                        vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                        "${port}",
                    },
                },
            }
            local js_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

            for _, language in ipairs(js_filetypes) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

			-- Auto open/close UI - other config
			-- dap.listeners.before.attach.dapui_config = function()
			--   ui.open()
			-- end
			-- dap.listeners.before.launch.dapui_config = function()
			--   ui.open()
			-- end
			-- dap.listeners.before.event_terminated.dapui_config = function()
			--   ui.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			--   ui.close()
			-- end

			-- Auto open/close UI
			if dap.listeners then
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
			vim.keymap.set("n", "<leader>dc", dap.continue, opts)
			vim.keymap.set("n", "<leader>di", dap.step_into, opts)
			vim.keymap.set("n", "<leader>do", dap.step_over, opts)
			vim.keymap.set("n", "<leader>dO", dap.step_out, opts)
			vim.keymap.set("n", "<leader>dq", dap.terminate, opts)
			vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
			vim.keymap.set("n", "<space>dr", dap.run_to_cursor)

			vim.keymap.set("n", "<space>?", function()
				dapui.eval(nil, { enter = true })
			end)
		end,
	},
}
