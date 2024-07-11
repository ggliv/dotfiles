return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      component_separators = '|',
      section_separators = '',
    }
  },
  config = function(_, opts)
    require("lualine").setup(opts)
    -- don't show the mode on the default bar if using lualine
    vim.opt.showmode = false
  end
}
