return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file" }, --add .clang-format file in your home directory with your custom stylings or simply replace --style=file with --style=GNU
					-- my custom style is

					-- BasedOnStyle: LLVM
					-- IndentWidth: 4
					-- UseTab: Always
					-- BreakBeforeBraces: Allman
					-- AllowShortFunctionsOnASingleLine: InlineOnly
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
