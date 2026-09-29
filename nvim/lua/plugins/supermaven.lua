return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",      -- Change to "<C-l>" if you have snippet conflicts
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {
        "help",
        "markdown",
        "gitcommit",
        "oil",
        "snacks_*",
        "bigfile",
      },
      color = {
        suggestion_color = "#6e6a86",   -- Subtle ghost text (adjust to your theme)
        cterm = 244,
      },
      log_level = "off",                -- Set to "info" if you want logs
      disable_inline_completion = false, -- Keep ghost-text suggestions enabled
      disable_keymaps = false,
    })
  end,
}
