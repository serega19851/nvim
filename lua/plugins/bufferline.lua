return {
    { 
        "akinsho/bufferline.nvim", 
        version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    show_buffer_close_icons = false,
                    separator_style = "slant",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer", 
                            highlight = "Directory",
                            text_align = "left"
                        }
                    }
                }
            })

        end
    },
}
