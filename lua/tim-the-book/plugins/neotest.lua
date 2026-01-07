return {
    {
        'nvim-neotest/neotest',
        
        dependencies = {
            'nvim-neotest/nvim-nio',
            'nvim-lua/plenary.nvim',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-neotest/neotest-python',
        },

        config = function()
            local neotest = require('neotest')
            
            -- Configure neotest
            neotest.setup {
                adapters = {
                    require('neotest-python') {
                        runner = 'pytest',
                        args = { '-q' },
                        python = '.venv/bin/python',
                    },
                },
            }

            -- Keybindings
            vim.keymap.set('n', '<leader>tt', function()
                neotest.run.run()
            end, { desc = 'Run the test under the cursor' } )

            vim.keymap.set('n', '<leader>tf', function() 
                neotest.run.run(vim.fn.expand('%'))
            end, { desc = 'Run tests in the current buffer' } )

            vim.keymap.set('n', '<leader>ts', function()
                neotest.output.open({ enter = true, auto_close = true })
            end, { desc = 'Show test output' } )

        end,
    },
}
