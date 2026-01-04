-- Diagnostic config
vim.diagnostic.config({
  float = { border = "rounded", source = "if_many" },
  virtual_text = true,
})

vim.o.updatetime = 200

-- Enable LSP servers
-- Install manually, or use Mason (:MasonInstall <server>)
--   npm install -g typescript-language-server typescript
--   npm install -g oxlint
--   brew install lua-language-server
--   uv tool install ruff
--   uv tool install ty
vim.lsp.enable({ "lua_ls", "oxlint", "ruff", "ts_ls", "ty" })
