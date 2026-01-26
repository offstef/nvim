function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- 1. BOOTSTRAP DE LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. LISTA DE PLUGINS
require("lazy").setup({
    -- TEMA
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = { italic = false }
            })
            ColorMyPencils()
        end
    },

    -- DASHBOARD (AQUÍ ESTÁ LA CORRECCIÓN: Citas Restauradas)
    {
        "goolord/alpha-nvim",
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            
            -- Intentamos cargar tu archivo de citas con seguridad
            local status_ok, citas = pcall(require, "xtef.citas")
            if status_ok then
                dashboard.section.header.val = citas.get_header()
                dashboard.section.header.opts.hl = "String" -- Color para las citas (o usa "Italic")
                dashboard.section.header.opts.position = "center"
            end

            dashboard.section.buttons.val = {
                dashboard.button("f", "  Buscar Archivo", ":Telescope find_files<CR>"),
                dashboard.button("r", "  Recientes", ":Telescope oldfiles<CR>"),
                dashboard.button("g", "  Buscar Texto", ":Telescope live_grep<CR>"),
                dashboard.button("v", "󱄔  Editar Citas", ":e ~/.config/nvim/lua/xtef/citas.lua<CR>"),
                dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
            }
            require("alpha").setup(dashboard.opts)
        end
    },

    -- BARRA DE ESTADO
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = { 
                theme = "auto",
                globalstatus = true,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            }
        }
    },

    -- PESTAÑAS
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                separator_style = "thin",
                diagnostics = "nvim_lsp",
            }
        }
    },

    -- GIT
    { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "lewis6991/gitsigns.nvim", config = true },

    -- BUSCADOR (TELESCOPE)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = { file_ignore_patterns = { "node_modules", ".git" } }
            })
        end
    },

    -- IA: COPILOT
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = { accept = "<S-Tab>" },
                },
            })
        end,
    },

    -- TREESITTER
    {
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
    },

    -- TERMINAL
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                direction = 'float',
                float_opts = { border = 'curved' }
            })
        end
    },

    -- UTILS: PAIRS & CMP
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", "windwp/nvim-autopairs",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            
            local ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
            if ok then cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done()) end

            cmp.setup({
                snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
                window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
                        else fallback() end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' }, { name = 'path' } })
            })
        end
    },

    -- LSP & FORMATTING
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "rust_analyzer", "lua_ls" },
                handlers = {
                    function(server_name)
                        local capabilities = require('cmp_nvim_lsp').default_capabilities()
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,
                }
            })
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = { python = { "black" }, rust = { "rustfmt" }, lua = { "stylua" } },
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        }
    },
    { "amitds1997/remote-nvim.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-telescope/telescope.nvim" }, config = true },
})

-- 3. CONFIGURACIÓN GENERAL
vim.opt.termguicolors = true
vim.opt.autowriteall = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.clipboard = "unnamedplus" -- Descomentar si quieres clipboard compartido por defecto

-- 4. KEYMAPS (POWER REMAPS)
vim.g.mapleader = " "
local keymap = vim.keymap.set

-- === TELESCOPE ===
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto global" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Ver pestañas abiertas" })
keymap("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Buscar TODO" })

-- === COPIAR Y PEGAR ===
keymap({"n", "v"}, "<leader>y", [["+y]], { desc = "Copiar al sistema" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Copiar línea al sistema" })
keymap("n", "<leader>ya", [[:%y+<CR>]], { desc = "Copiar archivo entero" })
keymap("x", "<leader>p", [["_dP]], { desc = "Pegar sticky" })

-- === MOVER CÓDIGO ===
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover bloque abajo" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover bloque arriba" })

-- === FLUIDEZ ===
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- === VENTANAS ===
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Salir" })
keymap("n", "<leader>x", ":bdelete<CR>", { silent = true })
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- 5. LSP ATTACH
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        keymap('n', 'K', vim.lsp.buf.hover, opts)
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
        keymap('n', 'gr', require('telescope.builtin').lsp_references, opts)
        keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
        keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
})
