return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help, {
					focusable = false,
					focus = false
				}
			)

			vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
			vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
			vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
			vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
		end,
		dependencies = {
			"folke/neodev.nvim",
		}
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = false,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
						on_attach = function(_, buffer_nr)
							local opts = { buffer = buffer_nr }
							vim.keymap.set({ "n", "i" }, "<C-S-Space>",
								vim.lsp.buf.signature_help)
							vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
							vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
							vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
							vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
							vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition,
								opts)
							vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
							vim.keymap.set('n', '<C-.>', vim.lsp.buf.code_action, opts)
							vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
							vim.keymap.set('n', '<S-C-I>',
								function() vim.lsp.buf.format { async = true } end, opts)
						end
					}
				end
			}
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {}
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	branch = "dev",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = {
	-- 	},
	-- }
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
}
