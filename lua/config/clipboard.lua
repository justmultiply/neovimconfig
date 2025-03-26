vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy"
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste"
  },
  cache_enabled = 0,
}

