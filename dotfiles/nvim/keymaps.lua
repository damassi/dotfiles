-- General keymaps only. Plugin-specific keymaps are colocated with plugin
-- configs in `./plugins.lua`, and lazily invoked.

vim.keymap.set("i", "jk", "<Esc>")

-- Exit terminal mode
vim.keymap.set("t", ",a", "<C-\\><C-n>")
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true })

-- Tab (workspace) navigation
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>]", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>[", ":tabprev<CR>", { silent = true })

-- Save file: Cmd+S (iTerm: Send Hex Code 0x13)
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { silent = true })

-- Copy: Cmd+C (iTerm: Send Escape Sequence 'c' -> M-c)
vim.keymap.set("v", "<M-c>", '"+y', { silent = true })

-- New file: Cmd+N (iTerm: Send Hex Code 0x0e)
vim.keymap.set("n", "<C-n>", "<Cmd>enew<CR>", { silent = true })
vim.keymap.set("n", "<leader>nf", "<Cmd>enew<CR>", { silent = true })

-- Page down: Ctrl+D (since Ctrl+F is tmux prefix)
vim.keymap.set("n", "<C-d>", "<C-f>", { silent = true })

-- Undo: Cmd+Z (iTerm: Send Hex Code 0x1a)
vim.keymap.set("n", "<C-z>", "u", { silent = true })

-- Redo: Cmd+Y (iTerm: Send Hex Code 0x19)
vim.keymap.set("n", "<C-y>", "<C-r>", { silent = true })

-- Move line up/down: Option+Up/Down
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { silent = true })

-- Indent/unindent: preserve selection
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })

-- Toggle comment: Cmd+/ (iTerm: Send Hex Code 0x1e)
-- On empty line: insert comment prefix and enter insert mode
-- Otherwise: toggle comment on current line
local toggle_or_insert_comment = function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    local comment_string = vim.bo.commentstring
    if comment_string and comment_string ~= "" then
      local prefix = comment_string:gsub("%%s", " ")
      vim.api.nvim_set_current_line(prefix)
      vim.cmd("startinsert!")
    end
  else
    vim.cmd("normal gcc")
  end
end
vim.keymap.set({ "n", "i" }, "<C-^>", toggle_or_insert_comment, { silent = true })
vim.keymap.set("v", "<C-^>", "gc", { remap = true, silent = true })

-- Close floating windows
vim.keymap.set("n", "<Esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { silent = true })
