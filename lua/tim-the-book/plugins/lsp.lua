return {
	{
		'williamboman/mason.nvim',
		config = function()
			require 'mason'.setup()
		end,
	},

	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },

		config = function()
			require 'mason-lspconfig'.setup {
				ensure_installed = { 'ruff', 'basedpyright' },
				automatic_installation = true,
                automatic_enable = false,
			}
		end,
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local on_attach = function(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
                
                if client.name == 'ruff' then
                    client.server_capabilities.hoverProvider = false
                end

			    -- Keybindings
                -- LSP operations
				map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
				map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
				map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
				map('n', 'gr', vim.lsp.buf.references, 'References')
				map('n', 'K', vim.lsp.buf.hover, 'Hover')
				map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
				map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
				map('n', '[d', vim.diagnostic.goto_prev, 'Prev diagnostic')
				map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')

                -- Formatting
                map('n', '<leader>w', function()
                    vim.lsp.buf.format { async = true }
                    vim.print('File formatted!')
                end, 'Format the whole file')

                map('v', '<leader>w', function()
                    vim.lsp.buf.format { async = true }
                    vim.print('Section formatted!')
                end, 'Format selection')

			end

            vim.lsp.config('*', {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Ruff formatting and linting
            vim.lsp.config('ruff', {
                settings = {},
            })

			-- BasedPyright type checking
			vim.lsp.config('basedpyright', {
				settings = { basedpyright = { analysis = {
                    typeCheckingMode = 'basic',
                    diagnosticSeverityOverrides = {
                        reportUnusedImport = "none",
                        reportUnusedVariable = "none",
                    },
                }}}
			})

            -- Enable LSPs
            vim.lsp.enable { 'basedpyright', 'ruff' } 
		end
	},
}

