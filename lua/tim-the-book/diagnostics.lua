vim.diagnostic.config {
    virtual_text = {
        prefix = "●",
        spacing = 4,
        source = "if_many",
        format = function(diagnostic)
            local max = 60
            local msg = diagnostic.message:gsub("\n.*", "")
            
            if #msg > max then
              msg = msg:sub(1, max - 1) .. "…"
            end
            
            return msg
        end,
    },
    
    float = {
        focus = false,
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },

    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}

