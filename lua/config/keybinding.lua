-- keybinding.lua
-- realSUDO's cheat codes for nvim ✨

local toggleCopilot = require("config.toggleCopilot")
local terminal = require("config.myterminal") -- Terminal config module

-- Mini-map-maker (because typing full commands is for noobs)
local function map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Window-hopping (like tabs but cooler)
map("n", "<C-h>", "<C-w>h") -- ←
map("n", "<C-j>", "<C-w>j") -- ↓
map("n", "<C-k>", "<C-w>k") -- ↑ 
map("n", "<C-l>", "<C-w>l") -- →

--Terminal tricks
vim.keymap.set("t", "<leader>tt", [[<C-\><C-n>:close<CR>]], { desc = "Close Terminal Pane", silent = true })
vim.keymap.set("n", "<leader>tt", function()
  terminal.OpenClearTerminal("horizontal")
end, { desc = "Open Horizontal Terminal", silent = true })

vim.keymap.set("n", "<leader>ty", function()
  terminal.OpenClearTerminal("vertical")
end, { desc = "Open Vertical Terminal", silent = true })

-- Magic buttons
map("n", "<C-p>", "<cmd>Telescope find_files<CR>") -- Find All The Things™
map("n", "<leader><leader><leader>r", ":w<CR> | :lua CompileAndRun()<CR>") -- Compile-go-brrr (with a twist)

-- Toggle-ables (FIXED)
vim.keymap.set("n", "<leader><leader>co", toggleCopilot.ToggleCopilot, { desc = "AI go brrr" })
map("n", "<leader>tw", "<cmd>lua require('config.toggleWrap').toggle()<CR>", { desc = "Wrap it like burrito" })

-- Pro tip: Now you can type these with BOTH hands while drinking coffee ☕

