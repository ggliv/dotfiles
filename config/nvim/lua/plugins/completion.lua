return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  -- Only load if we're in an LSP session,
  -- since that's all cmp is used for and
  -- hrsh7th/nvim-cmp#1841 causes massive
  -- slowdown on large files
  event = "LspAttach",
  config = function()
    local cmp = require("cmp")
    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
          else
            fallback()
          end
        end, {"i", "s"}),
      },
      sources = {
        { name = 'nvim_lsp' }
      }
    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  end
}
