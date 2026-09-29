return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame = true,
  },
  keys = {
    { "<leader>hi", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
  },
}
