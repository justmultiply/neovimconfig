vim.keymap.set("t", "<leader>tt", "exit <CR> ", {})

vim.api.nvim_set_keymap(
	"n",
	"<leader><leader><leader>r",
	":w<CR> | :lua CompileAndRun()<CR>",
	{ noremap = true, silent = true }
)


--toggle terminal
vim.api.nvim_set_keymap('n', '<leader>tt', ':lua OpenClearTerminal("horizontal")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ty', ':lua OpenClearTerminal("vertical")<CR>', { noremap = true, silent = true })
