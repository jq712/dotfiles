return {
  -- Package Manager for LSPs, formatters, and linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  -- Bridge between Mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- List language servers to automatically install
      ensure_installed = { "lua_ls" },
      
      -- Modern handler configuration replacing setup_handlers()
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },

  -- Main LSP config mapping capabilities
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Quick diagnostic mappings
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

      -- Keymaps configured only when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
