return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      -- Auto-refresh open oil buffers when the directory changes on disk
      -- (e.g. an AI agent adds/removes/renames files), mirroring the
      -- checktime-based reload in autocmds.lua for normal file buffers.
      watch_for_changes = true,
      columns = {
        "icon",
      },
      view_options = {
        -- Show hidden files and directories (like .git or .config)
        show_hidden = true,
      },
    })

    -- Map '-' to open the parent directory explorer
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
