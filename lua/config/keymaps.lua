local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fast saving
keymap('n', '<C-s>', ':write!<CR>', { silent = true, desc = 'Save file' })
keymap('n', '<C-q>', ':q!<CR>', opts)

-- Fast navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })

-- Resize Windows
keymap('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height', silent = true })
keymap('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height', silent = true })
keymap('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width', silent = true })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width', silent = true })

-- Manage buffers
keymap('n', '<A-l>', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<A-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<A-w>', function()
    local current_buf = vim.api.nvim_get_current_buf()

    local buffers = vim.fn.getbufinfo { buflisted = 1 }

    if #buffers <= 1 then
        vim.cmd 'enew'
        vim.api.nvim_buf_delete(current_buf, { force = true })
    else
        vim.cmd 'bp | bd #'
    end
end, { desc = 'Close buffer safely', silent = true })
-- Move selected text in Visual Mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected line up' })

-- Keep cursor centered when navigating
keymap('n', 'J', 'mzJ`z', opts) -- Join lines without moving cursor
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down keeping cursor centered' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up keeping cursor centered' })
keymap('n', 'n', 'nzzzv', { desc = 'Next search centered' })
keymap('n', 'N', 'Nzzzv', { desc = 'Previous search centered' })

-- Do not use Space key to advance
keymap('n', '<Space>', '<Nop>', { silent = true })

-- Paste without losing clipboard content
keymap('x', '<leader>p', [["_dP]], { desc = 'Paste without overwriting register' })

-- Make current file executable
keymap('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable', silent = true })

-- Delete without saving to register (sends to null register)
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without saving to register' })

-- Integrated terminal shortcuts
keymap('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
keymap('n', '<leader>tt', '<cmd>split term://bash<CR>', { desc = 'Open terminal in horizontal split' })
keymap('n', '<leader>tv', '<cmd>vsplit term://bash<CR>', { desc = 'Open terminal in vertical split' })

-- Quality of Life Improvements ------------------------------------------------

-- Highlight last selection when "yanking" (copying)
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 300,
        }
    end,
})

-- Clear search highlight with <leader><space>
keymap('n', '<leader><space>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- ctrl + x to cut full line
keymap('n', '<C-x>', 'dd', opts)

-- Select all
keymap('n', '<C-a>', 'ggVG', opts)

-- write file in current directory
-- :w %:h/<new-file-name>
keymap('n', '<C-n>', ':w %:h/', opts)

-- Split Current Window (No New File)
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })

-- better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

vim.keymap.set('n', '<leader>oc', '<cmd>TermExec cmd="opencode" direction=float<CR>', { desc = 'Open OpenCode' })
