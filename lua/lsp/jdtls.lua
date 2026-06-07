local home = os.getenv 'HOME'

vim.lsp.config('jdtls', {
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = 'JavaSE-17',
                        path = home .. '/.sdkman/candidates/java/17.0.10-tem',
                    },
                    {
                        name = 'JavaSE-21',
                        path = home .. '/.sdkman/candidates/java/21.0.2-tem',
                        default = true,
                    },
                },
            },
        },
    },
})

vim.lsp.enable 'jdtls'
