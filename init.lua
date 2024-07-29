vim.cmd("set mouse=a")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set autoindent")
vim.cmd("set number")

--setting relativenumber
vim.wo.relativenumber = true

require("config.lazy")
require("lazy").setup("plugins")
require("config.keybinding")
-- setting clangformat gnu
require("config.compileandrun")
require("config.myterminal")

require("config.snippets")
