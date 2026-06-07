return {
    { 'tpope/vim-fugitive' }, -- Powerful Git integration for Vim,
    { 'tpope/vim-rhubarb' }, -- GitHub integration for vim-fugitive ,
    -- { 'folke/which-key.nvim' }, -- Hints keybinds,
    {
        -- Autoclose parentheses, brackets, quotes, etc.
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {},
    },
    {
        -- Highlight todo, notes, etc in comments
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        -- High-performance color highlighter
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
}
