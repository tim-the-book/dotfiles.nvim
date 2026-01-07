return {
    'nvim-telescope/telescope.nvim',
    
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    
    config = function()
	local builtin = require('telescope.builtin')
	
	-- Setup 
	require('telescope').setup {}
	
	-- Keybindings
	vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>h', builtin.buffers, { desc = 'Telescope buffers' })

    end,
}
