require 'config.options'
require 'config.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

local rtp = vim.opt.rtp

rtp:prepend(lazypath)

require 'config.lsp'
require 'lsp.jdtls'

require('lazy').setup {
    require 'plugins.neotree',
    require 'plugins.colorscheme',
    require 'plugins.lualine',
    require 'plugins.markdown-preview',
    require 'plugins.bufferline',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.toggleterm',
    require 'plugins.blink',
    require 'plugins.comment',
    require 'plugins.gitsigns',
    require 'plugins.git-blame',
    require 'plugins.indent-blankline',
    require 'plugins.mason',
    require 'plugins.misc',
    require 'plugins.nvim-lsp',
    require 'plugins.nvim-ufo',
    require 'plugins.actions-preview',
    require 'plugins.none-ls',
    require 'plugins.alpha',
    require 'plugins.persistence',
    require 'plugins.transparent',
}
