local M = {}

function M.OpenClearTerminal(direction)
  if direction == 'horizontal' then
    vim.cmd("belowright 13split | terminal")
  elseif direction == 'vertical' then
    vim.cmd("vsplit | terminal")
  end

  vim.api.nvim_feedkeys("clear\n", "n", false)
  vim.cmd("startinsert")

  vim.cmd [[
    augroup TerminalAutoClose
      autocmd!
      autocmd TermClose * if !v:event.status | close | endif
    augroup END
  ]]
end

return M

