return {
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
				keymaps = {
					init_selection = false, 
					node_incremental = false,
					scope_incremental = false,
					node_decremental = false,
				},
			},
			indent = {
				enable = false
			}
		},
	},
}
