-- To set up a language server, use :Mason or :MasonInstall
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      -- Automatic setup for mason-installed LSP servers
      -- See `:h mason-lspconfig-automatic-server-setup`
      config = function()
        -- Override dumb indent formatting to use LSP
        local use_lsp_format = function(_, bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP', force = true })
        end

        require("mason-lspconfig").setup_handlers {
          function(server)
            require("lspconfig")[server].setup {
              on_attach = use_lsp_format
            }
          end
        }
      end,
    },
  }
}
