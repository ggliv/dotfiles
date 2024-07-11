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
        local use_lsp_format = function(bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP', force = true })
        end

        local lsp_mappings = function(bufnr)
          local opts = { buffer = bufnr, noremap = true, silent = true }
          -- These use the tag stack, see `:h tagstack`
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.fn.extend(opts, { desc = "Go to declaration" }))
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.fn.extend(opts, { desc = "Go to definition" }))
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.fn.extend(opts, { desc = "Go to implementation" }))
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.fn.extend(opts, { desc = "Go to references" }))
        end

        require("mason-lspconfig").setup_handlers {
          function(server)
            require("lspconfig")[server].setup {
              on_attach = function(_, bufnr)
                use_lsp_format(bufnr)
                lsp_mappings(bufnr)
              end
            }
          end
        }
      end,
    },
  }
}
