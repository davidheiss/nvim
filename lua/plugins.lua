return {
    {
	"folke/tokyonight.nvim",
    },
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
	    auto_install = true,
	    highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	    },
	    incremental_selection = {
		enable = true,
	    },
	    indent = {
		enable = true
	    }
	},
    },
    {
	"williamboman/mason.nvim",
	opts = {}
    },
    {
	"folke/neodev.nvim",
	opts = {
	    library = {
		plugins = {
		    "nvim-dap",
		    "nvim-dap-ui",
		    "telescope"
		}, types = true
	    },
	}
    },
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "folke/neodev.nvim",
	}

    },
    {
	"williamboman/mason-lspconfig.nvim",
	opts = function ()
	    local lspconfig = require("lspconfig")
	    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	    return {
		ensure_installed = { "lua_ls" },
		automatic_installation = true,
		handlers = {
		    function (server)
			lspconfig[server].setup({
			    capabilities = capabilities
			})
		    end
		}
	    }
	end,
    },
    {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
    },
    {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	config = function ()
	    local cmp = require("cmp")

	    local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	    end

	    local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	    end

	    cmp.setup({
		snippet = {
		    expand = function(args)
			require('luasnip').lsp_expand(args.body)
		    end,
		},
		window = {
		    -- completion = cmp.config.window.bordered(),
		    -- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
		    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<C-e>'] = cmp.mapping.abort(),
		    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'luasnip' }
		}, { { name = 'buffer' } })
	    })

	    cmp.setup.cmdline({ '/', '?' }, {
	    	mapping = cmp.mapping.preset.cmdline(),
	    	sources = {
	    		{ name = 'buffer' }
	    	}
	    })

	    cmp.setup.cmdline(':', {
	    	mapping = cmp.mapping.preset.cmdline(),
	    	sources = cmp.config.sources({
	    		{ name = 'path' }
	    	}, { { name = 'cmdline' } })
	    })
	end
    },
    {
	"hrsh7th/cmp-nvim-lsp"
    },
    {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {}
    },
    {
	"rcarriga/nvim-dap-ui",
	opts = {},
	dependencies = { "mfussenegger/nvim-dap" },
	init = function ()
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
	end
    },
    {
	'stevearc/dressing.nvim',
	opts = {},
    },
    {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}
