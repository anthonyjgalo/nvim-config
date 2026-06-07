return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            return str:sub(1, 1)
                        end,
                    },
                },
                lualine_b = { 'branch' },
                lualine_c = {
                    { 'filename', file_status = true, path = 0 },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        sections = { 'error', 'warn' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    },
                    {
                        'diff',
                        colored = false,
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                    },
                    { 'filetype' },
                },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
            theme = 'tokyonight',
        }
    end,
}
