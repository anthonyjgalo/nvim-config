return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },
    version =  "1.*",
    config = function()
        require'blink.cmp'.setup({
            snippets = { preset = 'luasnip' },
            signature = { enabled = true },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "normal"
            },
            sources = {
                default = {'lsp', 'buffer', 'path', 'snippets' },
                providers = {}
            },
            keymap = {
                preset = 'default'
            },
            cmdline = {
                enabled = false,
                completion = { menu = { auto_show = true } },
                keymap = {
                    ["<CR>"] = { "accept_and_enter", "fallback" },
                },
            },
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true
                    }
                },
                menu = {
                    border = nil,
                    scrolloff = 1,
                    scrollbar = false,
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",      "label_description", gap = 1 },
                            { "kind" },
                            { "source_name" },
                        },
                        treesitter = {'lsp'}
                    },
                },
                documentation = {
                    window = {
                        border = nil,
                        scrollbar = false,
                        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                    },
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                ghost_text = {
                    enabled = true
                }
            },
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
