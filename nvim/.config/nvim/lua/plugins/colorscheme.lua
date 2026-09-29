return {
  -- ============================================
  -- ACTIVE COLORSCHEME
  -- ============================================

  {
    "daltonmenezes/aura-theme",
    priority = 1000,
    lazy = false,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      -- clear backgrounds so ghostty's background-opacity shows through
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "aura-*",
        callback = function()
          for _, group in ipairs({
            "Normal", "NormalNC", "NormalFloat", "FloatBorder", "SignColumn",
            "LineNr", "EndOfBuffer", "StatusLine", "StatusLineNC", "TabLineFill",
          }) do
            vim.api.nvim_set_hl(0, group, vim.tbl_extend("force",
              vim.api.nvim_get_hl(0, { name = group, link = false }), { bg = "NONE" }))
          end
        end,
      })
      vim.cmd.colorscheme("aura-dark")
    end,
  },

  -- previous active theme
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",        -- "storm" | "night" | "moon" | "day"
      transparent = true,     -- let ghostty's background-opacity show through
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- ============================================
  -- HACKER / RETRO / OLD SCHOOL THEMES
  -- ============================================

  { "mrpbennett/vault" },

  -- Classic retro terminal feel (recommended)
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
      contrast = "hard",
    },
  },

  -- Literal green-on-black Matrix / hacker look
  {
    "luisiacc/the-matrix.nvim",
  },

  -- Rustic, dark, moody (great hacker vibe)
  {
    "rebelot/kanagawa.nvim",
  },

  -- ============================================
  -- POPULAR MODERN DARK THEMES
  -- ============================================

  -- Very popular soft dark theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- mocha = darkest
    },
  },

  -- Elegant dark theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

}
