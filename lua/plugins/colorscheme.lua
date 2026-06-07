return {
    'folke/tokyonight.nvim',
    lazy = false,
    name = 'tokyonight',
    priority = 1000,
    opts = {},
    config = function()
        -- require('tokyonight').setup {
        --     transparent = true,
        -- }
        vim.cmd 'colorscheme tokyonight'
        -- vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
        -- vim.cmd 'highlight NonText guibg=NONE ctermbg=NONE'
        vim.cmd 'highlight NeoTreeNormal guibg=none'
        vim.cmd 'highlight NeoTreeNormalNC guibg=none'
        vim.cmd 'highlight TabLineFill guibg=none'
    end,
}

-- return {
--     'savq/melange-nvim',
--     priority = 1000,
--     name = 'melange',
--     lazy = false,
--     config = function()
--         vim.cmd 'colorscheme melange'
--         -- vim.o.background = 'dark'
--         -- vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
--         -- vim.cmd 'highlight NonText guibg=NONE ctermbg=NONE'
--         -- vim.cmd 'highlight NeoTreeNormal guibg=none'
--         -- vim.cmd 'highlight NeoTreeNormalNC guibg=none'
--     end,
-- }

-- return {
--     'zenbones-theme/zenbones.nvim',
--     dependencies = 'rktjmp/lush.nvim',
--     priority = 1000,
--     name = 'zenbones',
--     lazy = false,
--     config = function()
--         vim.cmd 'colorscheme neobones'
--         -- vim.o.background = 'dark'
--         -- vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
--         -- vim.cmd 'highlight NonText guibg=NONE ctermbg=NONE'
--         -- vim.cmd 'highlight NeoTreeNormal guibg=none'
--         -- vim.cmd 'highlight NeoTreeNormalNC guibg=none'
--     end,
-- }

--
-- return {
--     'rebelot/kanagawa.nvim',
--     priority = 1000,
--     name = 'kanagawa',
--     config = function()
--         -- Default options:
--         require('kanagawa').setup {
--             compile = false, -- enable compiling the colorscheme
--             undercurl = true, -- enable undercurls
--             commentStyle = { italic = true },
--             functionStyle = {},
--             keywordStyle = { italic = true },
--             statementStyle = { bold = true },
--             typeStyle = {},
--             transparent = true, -- do not set background color
--             dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--             terminalColors = true, -- define vim.g.terminal_color_{0,17}
--             colors = { -- add/modify theme and palette colors
--                 palette = {},
--                 theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--             },
--             theme = 'wave', -- Load "wave" theme
--             background = { -- map the value of 'background' option to a theme
--                 dark = 'wave', -- try "dragon" !
--                 light = 'lotus',
--             },
--         }
--         vim.cmd 'colorscheme kanagawa'
--         --
--         -- vim.o.background = 'dark'
--         --
--         -- vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
--         -- vim.cmd 'highlight NonText guibg=NONE ctermbg=NONE'
--     end,
-- }
