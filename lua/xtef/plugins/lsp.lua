return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local capabilities = require('cmp_nvim_lsp').default_capabilities()
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,
            }
        })
    end
}
