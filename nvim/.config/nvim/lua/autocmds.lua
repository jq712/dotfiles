-- ── External file change detection & safe auto-reload ──────────────────────
vim.o.autoread = true            -- re-read files changed outside Neovim
vim.opt.updatetime = 1000        -- CursorHold fires after 1s idle (ms)

local grp = vim.api.nvim_create_augroup("auto_reload", { clear = true })

-- Trigger a disk check on the events that matter. checktime is cheap and
-- only reloads buffers that are (a) changed on disk and (b) NOT modified
-- locally, so it will never silently discard your unsaved edits.
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" },
  {
    group = grp,
    pattern = "*",
    callback = function()
      if vim.o.buftype ~= "nofile" and vim.fn.mode() ~= "c" then
        vim.cmd("checktime")
      end
    end,
  }
)

-- Temporary test aid to confirm reloads are firing; safe to remove later.
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = grp,
  pattern = "*",
  callback = function()
    vim.notify("Buffer reloaded from disk")
  end,
})

-- Conflict handling: file changed on disk AND buffer is modified locally.
-- Default behavior raises a prompt; we make the choice explicit and SAFE
-- (never auto-overwrite the on-disk agent output or your local edits).
vim.api.nvim_create_autocmd("FileChangedShell", {
  group = grp,
  pattern = "*",
  callback = function()
    local reason = vim.v.fcs_reason
    if reason == "changed" and not vim.bo.modified then
      vim.v.fcs_choice = "reload"      -- safe: no local edits, take disk copy
    else
      vim.v.fcs_choice = "ask"         -- conflict or delete: ask the human
    end
  end,
})
