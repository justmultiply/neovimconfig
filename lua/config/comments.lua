-- Function to set commentstring for specific filetypes
local function set_commentstring()
	vim.bo.commentstring = "// %s"
end

-- Autocommand for C files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = set_commentstring,
})

-- Autocommand for C++ files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = set_commentstring,
})
