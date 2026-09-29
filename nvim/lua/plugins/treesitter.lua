return {
  "nvim-treesitter/nvim-treesitter",
  -- Explicitly disable lazy loading as required by the new specification
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Direct installation list (natively evaluates as a no-op if already present)
    require("nvim-treesitter").install({ "c", "lua", "vim", "vimdoc", "markdown", "bash" })

    -- Centrally manage highlighting and indentation via native FileType hooks
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Safely activate native treesitter parsing for active buffers
        pcall(vim.treesitter.start)
        
        -- Enable the experimental smart indentation provided by the plugin
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
