-- Clear search highlights in Normal Mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- "Black Hole" Deletions & Clipboard Fixes
-- Delete a character without copying to clipboard
vim.keymap.set({'n', 'v'}, 'x', '"_x', { silent = true, desc = 'Delete character without copying' })

-- Delete text objects (like lines/words) without copying to clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { silent = true, desc = 'Delete without copying' })

-- Prevent visual mode pastes from overwriting your clipboard
vim.keymap.set('v', 'p', '"_dP', { silent = true, desc = 'Paste without overwriting clipboard' })

-- Visual Mode Enhancements
-- Move selected lines up and down in Visual Mode with auto-indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Scrolling & Navigation Centering
-- Keep cursor centered during half-page scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep cursor centered during search jumps
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match and center" })

-- Telescope integration shortcuts
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep search' })

-- Cheatsheet launcher
vim.keymap.set('n', '<leader>?', '<cmd>Cheatsheet<CR>', { desc = 'Open cheatsheet' })

-- Window Navigation 
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower split' })

-- Quick Window Splitting Shortcuts
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>s', '<cmd>split<CR>', { desc = 'Split window horizontally' })

-- Buffer Management 
-- Cycle through open buffers 
vim.keymap.set('n', 'H', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', 'L', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })

-- Close the current buffer easily using Leader 
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })

-- Open the interactive Telescope buffer list 
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>', { desc = 'Search open buffers' })

-- Gitsigns hunk navigation and preview
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Previous git hunk' })
vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Preview git hunk' })

-- Open the current PDF in your system's default viewer (Changed to <leader>O to avoid paste interference)
vim.keymap.set("n", "<leader>O", function()
  local file = vim.fn.expand("%")
  local os_name = vim.loop.os_uname().sysname

  if os_name == "Darwin" then
    vim.fn.jobstart({ "open", file })
  -- Windows detects as Windows_NT
  elseif os_name:match("Windows") then
    vim.fn.jobstart({ "cmd.exe", "/c", "start", "", file })
  else
    -- Default to Linux / xdg-open
    vim.fn.jobstart({ "xdg-open", file })
  end
end, { desc = "Open PDF in default system viewer" })
