-- General keymaps only. Plugin-specific keymaps are colocated with plugin
-- configs in `./plugins.lua`, and lazily invoked.

vim.keymap.set("i", "jk", "<Esc>")

-- Remap C-f full page scrolling to C-d, due to Tmux window
vim.keymap.set("n", "<C-d>", "<C-f>")

-- Exit terminal mode
vim.keymap.set("t", ",a", "<C-\\><C-n>")
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true })

-- Tab (workspace) navigation
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>]", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>[", ":tabprev<CR>", { silent = true })

-- New file
vim.keymap.set("n", "<leader>nf", ":enew<CR>", { silent = true })

-- Save file: Cmd+S (iTerm: Send Hex Code 0x13)
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { silent = true })

-- Copy: Cmd+C (iTerm: Send Hex Code 0x03)
vim.keymap.set("v", "<C-c>", '"+y', { silent = true })

-- Close floating windows
vim.keymap.set("n", "<Esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { silent = true })
