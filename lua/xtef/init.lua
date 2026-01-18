require("xtef.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "goolord/alpha-nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
          [[   __  __  _______  ______  ____   ]],
          [[   \ \/ / |__   __||  ____||  __|  ]],
          [[    \  /     | |   | |__   | |__   ]],
          [[    /  \     | |   |  __|  |  __|  ]],
          [[   / /\ \    | |   | |____ | |     ]],
          [[  /_/  \_\   |_|   |______||_|     ]],
          [[                                   ]],
      }
      alpha.setup(dashboard.opts)
  end },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {
      options = { 
        offsets = {{ filetype = "NvimTree", text = "EXPLORADOR", separator = true, text_align = "left" }},
        separator_style = "slant",
      }
  }},

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = true },
  { "stevearc/conform.nvim", opts = {
      formatters_by_ft = { python = { "black" }, rust = { "rustfmt" } },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
  }},
  "ibhagwan/fzf-lua",
})

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.autowriteall = true

vim.lsp.config('pyright', {})
vim.lsp.config('rust_analyzer', {})
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')