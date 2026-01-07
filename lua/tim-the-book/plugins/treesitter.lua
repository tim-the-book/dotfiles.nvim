return {
    'nvim-treesitter/nvim-treesitter',
    
    lazy = false,
    build = ':TSUpdate',

    config = function()
        local languages = { 'c', 'python', 'rust', 'go', 'lua' }

        -- Setup Treesitter
        local treesitter = require 'nvim-treesitter'
        treesitter.setup()
        treesitter.install(languages)

        -- Configure syntax highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function(args)
                vim.treesitter.start(args.buf)
            end,
        })

        -- Configure experimental indentation
        vim.api.nvim_create_autocmd('FileType', {
            pattern = languages,
            callback = function(args)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
