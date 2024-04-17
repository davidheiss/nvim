vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" }, {
	callback = function()
		if vim.bo.filetype == "FTerm" then
			return
		end
		vim.opt.relativenumber = true
	end
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" }, {
	callback = function()
		if vim.bo.filetype == "FTerm" then
			return
		end
		vim.opt.relativenumber = false
	end
})
