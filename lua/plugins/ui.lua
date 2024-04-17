return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			vim.opt.termguicolors = true
			vim.cmd.colorscheme "catppuccin"
		end,
		opts = {}
	},
	"stevearc/dressing.nvim",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				lsp_doc_border = true
			}
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		keys = function()
			local telescope = require "telescope.builtin"
			return {
				{ "<leader>ff", telescope.find_files, desc = "Find files" }
			}
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = function()
			local theme = require "lualine.themes.catppuccin-mocha"
			for _, mode in pairs(theme) do
				if mode.c ~= nil then
					mode.c.bg = nil
				end
			end

			return {
				options = {
					theme = theme,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "", right = "" }, padding = 0 }
					},
					lualine_b = {
						{ "branch", padding = { left = 1, right = 0 } }
					},
					lualine_c = { "filename" },
					lualine_x = { "diagnostics", "filetype" },
					lualine_y = {},
					lualine_z = {}
				}
			}
		end
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		opts = {}
	},
	-- {
	-- 	"numToStr/FTerm.nvim",
	-- 	opts = {
	-- 		cmd = "fish",
	-- 		border = "rounded"
	-- 	},
	-- 	keys = function()
	-- 		local fterm = require "FTerm"
	-- 		return {
	-- 			{ "<leader>t", fterm.open, desc = "Open terminal" }
	-- 		}
	-- 	end
	-- },
	--
	-- {
	-- 	'akinsho/toggleterm.nvim',
	-- 	version = "*",
	-- 	opts = {}
	-- },
	{
		"lewis6991/gitsigns.nvim",
		opts = {}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = {
				enabled = false,
			}
		}
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- 	keys = function ()
	-- 		local tree = require "neo-tree.command"
	-- 		return {
	-- 			{"<leader>e",function ()
	-- 				tree.execute({action = ""})
	-- 			end, desc = "Toogle explorer"}
	-- 		}
	-- 	end
	-- },
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	opts = {}
	-- }
}
