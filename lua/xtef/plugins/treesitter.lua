return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "javascript",
      "typescript",
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "rust",
      "go",
      "python",
      "tsx",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
      end,
    })
  end,
}
