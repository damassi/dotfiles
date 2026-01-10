vim.g.mapleader = ","

-- Map React filetypes to treesitter parsers
vim.treesitter.language.register("tsx", "typescriptreact")
vim.treesitter.language.register("tsx", "javascriptreact")

vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "99"
vim.opt.expandtab = true
vim.opt.fixendofline = true
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", pos)
  end,
})

-- Enable word wrap for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})
