vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<F5>", function ()
    if vim.fn.filereadable(".vscode/launch.json") then
	require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })
    end
    dap.continue();
end)
vim.keymap.set("n", "<F6>", dapui.toggle)

local telescope = require("telescope.builtin");
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
