return {
  {
    'williamboman/mason.nvim',
    config = function()
      require "mason".setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },

    config = function()
      require 'mason-lspconfig'.setup {
        ensure_installed = { 'basedpyright' },
        automatic_installation = true,
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Keybindings
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      end

      -- LSP Configuration
      vim.lsp.config('basedpyright', {
	on_attach = on_attach,
	capabilities = capabilities,
        settings = {
          python = {
            analysis = { typeCheckingMode = 'basic' },
          }, 
        }
      })
    
    end
  },
}

