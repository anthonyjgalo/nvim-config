return {
    'lewis6991/gitsigns.nvim',
    config = function ()
        require('gitsigns').setup {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~_' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~_' },
                untracked    = { text = '┆' },
            }
        }
    end
}
