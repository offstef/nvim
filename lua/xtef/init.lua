require("xtef.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            local citas = require("xtef.citas")

            dashboard.section.header.val = citas.get_header()

            dashboard.section.header.opts.position = "center"
            dashboard.section.header.opts.hl = "Italic"

            dashboard.section.buttons.val = {
                dashboard.button("f", "  Buscar Archivo", ":FzfLua files<CR>"),
                dashboard.button("s", "  Recientes", ":FzfLua oldfiles<CR>"),
                dashboard.button("v", "󱄔  Editar Citas", ":e ~/.config/nvim/lua/xtef/citas.lua<CR>"),
                dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
            }

            alpha.setup(dashboard.opts)
        end
    },

    { "catppuccin/nvim",         name = "catppuccin",                              priority = 1000 },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                offsets = { { filetype = "NvimTree", text = "EXPLORADOR", separator = true, text_align = "left" } },
                separator_style = "slant",
            }
        }
    },

    { "nvim-treesitter/nvim-treesitter",   build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim",           config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = { python = { "black" }, rust = { "rustfmt" } },
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        }
    },
    "ibhagwan/fzf-lua",
})

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.autowriteall = true

vim.lsp.config('pyright', {})
vim.lsp.config('rust_analyzer', {})
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
