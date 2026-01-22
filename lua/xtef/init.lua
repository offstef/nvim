require("xtef.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
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
                dashboard.button("f", "  Buscar Archivo", ":Telescope find_files<CR>"),
                dashboard.button("s", "  Recientes", ":Telescope oldfiles<CR>"),
                dashboard.button("v", "󱄔  Editar Citas", ":e ~/.config/nvim/lua/xtef/citas.lua<CR>"),
                dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
            }

            alpha.setup(dashboard.opts)
        end
    },
{
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- Opcional para cerrar con 'q' o usar floating windows
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                offsets = { { filetype = "NvimTree", text = "", separator = true, text_align = "left" } },
                separator_style = "slant",
            }
        }
    },
    
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({})
        end
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = { accept = "<M-l>" },
                },
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = { python = { "black" }, rust = { "rustfmt" } },
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        }
    },
    {
     "amitds1997/remote-nvim.nvim",
     version = "*",
     dependencies = {
       "nvim-lua/plenary.nvim",
       "MunifTanjim/nui.nvim",
       "nvim-telescope/telescope.nvim",
     },
     config = true,
    },
})

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")
vim.opt.autowriteall = true

vim.lsp.config('pyright', {})
vim.lsp.config('rust_analyzer', {})

vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
