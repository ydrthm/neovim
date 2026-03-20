-- ~/.config/nvim/after/lsp/vtsls.lua
-- This overrides the default config from nvim-lspconfig

return {
    on_attach = function(client)
        -- Disable formatting (let null-ls / conform / eslint handle it)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    end,

    settings = {
        -- 1. JavaScript specific
        javascript = {
            updateImportsOnFileMove = { enabled = "always" },
        },

        -- 2. TypeScript specific
        typescript = {
            updateImportsOnFileMove = { enabled = "always" },
        },

        -- 3. vtsls specific
        vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
                completion = {
                    enableServerSideFuzzyMatch = true,
                },
            },
        },
    },
}
