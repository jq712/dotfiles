-- Set the leader key to Spacebar (must be at the top of init.lua)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  Bootstrap the package manager automatically
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy.nvim to automatically look for plugin files inside lua/plugins/
require("lazy").setup({
  import = "plugins"
})

-- Load personal modular configurations 
require("autocmds")
require("keymaps")

-- Editor UI and Text Formatting Options
vim.opt.number = true     -- Turn on line numbers
vim.opt.wrap = true       -- Enable word wrapping
vim.opt.linebreak = true  -- Wrap lines at convenient points (like whitespaces) instead of mid-word

-- Spell Check Dictionary Configurations
vim.opt.spelllang = { "en" }
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- Use system keyboard
vim.opt.clipboard = "unnamedplus"

vim.cmd.colorscheme("aura-dark")
