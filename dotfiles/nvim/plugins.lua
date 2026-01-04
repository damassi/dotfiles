return {
  -- Colorscheme: https://github.com/rebelot/kanagawa.nvim
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- File tree: https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { visible = false, hide_dotfiles = false, hide_gitignored = false },
        },
        window = {
          mappings = {
            ["r"] = "rename",
            ["mm"] = "rename",
          },
        },
      })
      vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { silent = true })
      vim.keymap.set("n", "<leader>b", ":Neotree buffers<CR>", { silent = true })
      -- Toggle focus between file tree and code
      vim.keymap.set("n", "<leader>a", function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")
        else
          vim.cmd("Neotree focus")
        end
      end, { silent = true })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("Neotree show")
        end,
      })
    end,
  },

  -- Fuzzy finder: https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    end,
  },

  -- Syntax highlighting: https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "javascript", "typescript", "python", "json", "html", "css" },
      highlight = { enable = true },
    },
  },

  -- LSP installer: https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP bridge: https://github.com/williamboman/mason-lspconfig.nvim
  -- Auto-installs LSP servers in ensure_installed, or use :MasonInstall <server>
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local lsp = require("lsp")
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
        automatic_installation = true,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = lsp.on_attach,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              on_attach = lsp.on_attach,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- Autocompletion: https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
      })
    end,
  },

  -- Jump anywhere: https://github.com/folke/flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
    },
  },

  -- Tab bar: https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "tiagovla/scope.nvim",
    },
    config = function()
      require("scope").setup()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
          close_command = "Bdelete! %d",
          indicator = { style = "icon", icon = "▎" },
          show_close_icon = false,
          separator_style = "thin",
          offsets = {
            { filetype = "neo-tree", text = "Files", text_align = "center" },
          },
        },
      })
      -- Buffer navigation
      vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { silent = true })
      vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { silent = true })
      -- Jump to buffer by position
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
      end
    end,
  },

  -- Close buffer without closing window: https://github.com/famiu/bufdelete.nvim
  {
    "famiu/bufdelete.nvim",
    config = function()
      vim.keymap.set("n", "<leader>x", ":Bdelete<CR>", { silent = true })
      vim.keymap.set("n", "<M-w>", ":Bdelete<CR>", { silent = true })
    end,
  },

  -- Problems pane: https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
      vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
      -- Toggle problems pane: Cmd+J (iTerm: Send Hex Code 0x0a)
      vim.keymap.set("n", "<C-j>", "<cmd>Trouble diagnostics toggle<cr>", { silent = true })
    end,
  },

  -- Git signs in gutter: https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- LSP UI enhancements: https://github.com/nvimdev/lspsaga.nvim
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
      })

      local opts = { silent = true }
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
      -- Cmd+Click to go to definition (macOS sends Cmd as Meta)
      vim.keymap.set("n", "<M-LeftMouse>", "<LeftMouse><cmd>Lspsaga goto_definition<CR>", opts)
      -- Double-click to show hover docs
      vim.keymap.set("n", "<2-LeftMouse>", "<LeftMouse><cmd>Lspsaga hover_doc<CR>", opts)
      -- Shift+Click to show line diagnostics
      vim.keymap.set("n", "<S-LeftMouse>", "<LeftMouse><cmd>Lspsaga show_line_diagnostics<CR>", opts)
      vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
      vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts)
      vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)
      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
    end,
  },

  -- Claude Code integration: https://github.com/coder/claudecode.nvim
  {
    "coder/claudecode.nvim",
    config = true,
    opts = {
      terminal_cmd = "claude",
    },
    keys = {
      { "ca",         "<cmd>ClaudeCodeAccept<cr>", desc = "Accept Claude changes" },
      { "cx",         "<cmd>ClaudeCodeReject<cr>", desc = "Reject Claude changes" },
      { "<leader>cc", "<cmd>ClaudeCode<cr>",       desc = "Toggle Claude Code" },
    },
  },

  -- AI completions: https://github.com/Exafunction/windsurf.nvim
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        virtual_text = { enabled = true },
      })
    end,
  },

  -- Integrated terminal: https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = false,
      })
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { silent = true })
    end,
  },

  -- Global find and replace: https://github.com/MagicDuck/grug-far.nvim
  {
    "MagicDuck/grug-far.nvim",
    opts = {
      -- Open in current window instead of split
      windowCreationCommand = "enew",
    },
    cmd = "GrugFar",
    keys = {
      { "<leader>fr", "<cmd>GrugFar<cr>", desc = "Find and replace" },
      -- Cmd+Shift+F (iTerm: Send Hex Code 0x1f)
      { "<C-_>",      "<cmd>GrugFar<cr>", desc = "Find and replace" },
    },
  },

  -- Session management: https://github.com/rmagatti/auto-session
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      -- Neo-tree doesn't restore well
      pre_save_cmds = { "Neotree close" },
      pre_restore_cmds = { "Neotree close" },
      close_unsupported_windows = true,
    },
  },

  -- Formatter: https://github.com/stevearc/conform.nvim
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        -- prettierd: daemon that keeps prettier warm, much faster than cold starts
        -- https://github.com/fsouza/prettierd
        formatters_by_ft = {
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          json = { "prettierd" },
          html = { "prettierd" },
          css = { "prettierd" },
          markdown = { "prettierd" },
          yaml = { "prettierd" },
          lua = { "stylua" },
          python = { "ruff_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end)
    end,
  },
}
