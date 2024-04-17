return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			handlers = {
				function(config)
					require('mason-nvim-dap').default_setup(config)
				end,
			}
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		opts = {},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		init = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
		keys = function()
			local dap = require "dap"
			local dapui = require "dapui"
			local vscode = require "dap.ext.vscode"
			return {
				{
					"<F5>",
					function()
						vscode.load_launchjs(nil, {
							cppdbg = { "c", "cpp" }
						})
						dap.continue()
					end,
					desc = "Debugger continue"
				},
				{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
				{ "<leader>du", dapui.toggle,          desc = "Toggle breakpoint" },
				-- { "<S-F5>", dap.stop, desc="Debugger stop" },
				-- { "<C-S-F5>", dap.restart, desc="Debugger restart" },
				-- { "<F6>", dap.pause, desc="Debugger pause" },
				-- { "<F11>", dap.step_into, desc="Debugger step into" },
				-- { "<S-F11>", dap.step_out, desc="Debugger step out" },
			}
		end
	}
}
