-- Highlight selection on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 175 }
  end,
})

-- Don't insert comments with o/O in normal mode
vim.api.nvim_create_autocmd("FileType", {
  desc = "Don't insert comments with o/O in normal mode",
  callback = function()
    vim.opt.formatoptions:remove('o')
  end
})

-- Fold with tree-sitter if available
vim.api.nvim_create_autocmd("FileType", {
  desc = "Fold with tree-sitter if available",
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
  end,
})
