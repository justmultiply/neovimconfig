function CompileAndRun()
	local function get_project_root()
		local function is_git_repo(path)
			return vim.fn.isdirectory(path .. "/.git") == 1
		end

		local current_dir = vim.fn.expand("%:p:h")
		local root = current_dir

		while root ~= "/" do
			if is_git_repo(root) then
				return root
			end
			root = vim.fn.fnamemodify(root, ":h")
		end

		return vim.fn.getcwd()
	end

	local function ensure_compiled_files_dir()
		local project_root = get_project_root()
		local compiled_files_dir = project_root .. "/compiledFiles"
		if vim.fn.isdirectory(compiled_files_dir) == 0 then
			vim.fn.mkdir(compiled_files_dir, "p")
		end
		return compiled_files_dir
	end

	local compiled_files_dir = nil
	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		compiled_files_dir = ensure_compiled_files_dir()
	end

	if vim.bo.filetype == "c" then
		local output = compiled_files_dir .. "/" .. vim.fn.expand("%:t:r")
		vim.cmd("w") -- Save the file
		vim.cmd("!gcc % -o " .. output) -- Compile the file
		if vim.v.shell_error == 0 then
			vim.cmd("belowright 13split | terminal " .. output) -- Open a split terminal and run the output file
		else
			vim.api.nvim_echo({ { "Compilation failed!", "ErrorMsg" } }, false, {})
		end
	elseif vim.bo.filetype == "cpp" then
		local output = compiled_files_dir .. "/" .. vim.fn.expand("%:t:r")
		vim.cmd("w") -- Save the file
		vim.cmd("!g++ % -o " .. output) -- Compile the file
		if vim.v.shell_error == 0 then
			vim.cmd("belowright 13split | terminal " .. output) -- Open a split terminal and run the output file
		else
			vim.api.nvim_echo({ { "Compilation failed!", "ErrorMsg" } }, false, {})
		end
	elseif vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
		vim.cmd("belowright 13split | terminal node %")

	elseif vim.bo.filetype == "python" or vim.bo.filetype == "py" then
		vim.cmd("belowright 13split | terminal python3.8 %")

	elseif vim.bo.filetype == "html" then
		vim.cmd("w") --i mean yeah... we're just saving it
		vim.cmd("belowright 13split | terminal live-server ")
	end
end
