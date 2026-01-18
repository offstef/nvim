require("xtef.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Pantalla de inicio personalizada
  { "goolord/alpha-nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }, config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      
      dashboard.section.header.val = {
          [[                        ....                                .x+=:.        s                         ]],
          [[                    .x~X88888Hx.        oec :     oec :    z`    ^%      :8                  oec :  ]],
          [[                   H8X 888888888h.     @88888    @88888       .   <k    .88                 @88888  ]],
          [[                  8888:`*888888888:    8"*88%    8"*88%     .@8Ned8"   :888ooo      .u      8"*88%  ]],
          [[                  88888:        `%8    8b.       8b.      .@^%8888"  -*8888888   ud8888.    8b.     ]],
          [[                . `88888          ?>  u888888>  u888888> x88:  `)8b.   8888    :888'8888.  u888888> ]],
          [[                `. ?888%           X   8888R     8888R   8888N=*8888   8888    d888 '88%"   8888R   ]],
          [[                  ~*??.            >   8888P     8888P    %8"    R88   8888    8888.+"      8888P   ]],
          [[                 .x88888h.        <    *888>     *888>     @8Wou 9%   .8888Lu= 8888L        *888>   ]],
          [[                :"""8888888x..  .x     4888      4888    .888888P`    ^%888* '8888c. .+   4888      ]],
          [[                `    `*888888888"      '888      '888    `   ^"F        'Y"     "88888%     '888    ]],
          [[                        ""***""         88R       88R                             "YP'       88R    ]],
          [[                                        88>       88>                                        88>    ]],
          [[                                        48        48                                         48     ]],
          [[                                        '8        '8                                         '8     ]],
          [[                                                                                                    ]],
      }
      
      -- Opcional: Personalizar los botones del menú debajo del arte
      dashboard.section.buttons.val = {
          dashboard.button("f", "  Buscar Archivo", ":FzfLua files<CR>"),
          dashboard.button("e", "  Archivo Nuevo", ":ene <BAR> startinsert <CR>"),
          dashboard.button("s", "  Recientes", ":FzfLua oldfiles<CR>"),
          dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua<CR>"),
          dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
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