return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then return end
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust", "javascript", "typescript" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
