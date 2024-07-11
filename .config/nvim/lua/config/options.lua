-- This file is sourced before any others
-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Show line numbers
vim.opt.number = true

-- Keep undo trees after closing
vim.opt.undofile = true

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Show invisible characters
vim.o.listchars = 'tab:>-,trail:~'
vim.o.list = true

-- Custom commands
-- Autoindent with :Format when we don't have an LSP
vim.api.nvim_create_user_command('Format', function()
    vim.lsp.buf.format()
    local ogPos = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal('gg=G')
    vim.api.nvim_win_set_cursor(0, ogPos)
end, { desc = "Autoindent the current buffer" })

