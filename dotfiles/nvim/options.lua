vim.g.mapleader = ","

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.fixendofline = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", pos)
  end,
})
