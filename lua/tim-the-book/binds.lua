-- Binding for the built-in file browser
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw browser' })

-- Binding for opening a floating diagnostic window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open a floating diagnostics window' })

