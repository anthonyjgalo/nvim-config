vim.lsp.enable { 'lua_ls', 'ts_ls', 'html', 'cssls', 'jsonls', 'taplo', 'rust_analyzer', 'svelte', 'pyright', 'ruff', 'marksman', 'jdtls' }
-- Configure diagnostic display with custom signs

vim.diagnostic.config {
    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = true, -- Show source in diagnostic popup window
        header = '',
        prefix = '',
    },
    virtual_text = true,
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}

vim.lsp.inlay_hint.enable(true)

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('*', {
    capabilities = lsp_capabilities,
})

local blink_status_ok, blink = pcall(require, 'blink.cmp')

if blink_status_ok then
    local ext_capabilities = vim.tbl_deep_extend('force', {}, lsp_capabilities, blink.get_lsp_capabilities())
    -- Configure LSP servers using the new vim.lsp.config syntax
    -- Default configuration for all servers
    vim.lsp.config('*', {
        capabilities = ext_capabilities,
    })
end

-- local keymap = vim.keymap
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', '<cmd>Telescope lsp_definitions<CR>', '[G]oto [D]efinition')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gi', '<cmd>Telescope lsp_implementations<CR>', '[G]oto [I]mplementation')
        map('gr', '<cmd>Telescope lsp_references<CR>', '[G]oto [R]eferences')
        map('K', vim.lsp.buf.hover, 'Show Hover documentation')
        map('<C-k>', vim.lsp.buf.signature_help, 'Show Signature Help')
        map('<leader>d', vim.diagnostic.open_float, 'Show Line [D]iagnostics')
        map('[d', vim.diagnostic.goto_prev, 'Go to Previous Diagnostic')
        map(']d', vim.diagnostic.goto_next, 'Go to Next Diagnostic')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'v' })
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        -- map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        -- map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

        -- Find references for the word under your cursor.
        -- map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        -- map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        -- map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        -- map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        -- map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        -- map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        -- map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, ev.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = ev.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = ev.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                end,
            })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, ev.buf) then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf })
            end, '[T]oggle Inlay [H]ints')
        end

        -- local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
    end,
})
