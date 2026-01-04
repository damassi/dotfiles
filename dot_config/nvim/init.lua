-- Add dotfiles/nvim to Lua package path
local dotfiles = vim.fn.expand("~/dotfiles/nvim")
package.path = dotfiles .. "/?.lua;" .. package.path

-- Load config
require("options")
require("keymaps")
require("bootstrap")
