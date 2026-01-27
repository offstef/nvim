local keymap = vim.keymap.set

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto global" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Ver pestañas abiertas" })
keymap("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Buscar TODO" })

keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copiar al sistema" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Copiar línea al sistema" })
keymap("n", "<leader>ya", [[:%y+<CR>]], { desc = "Copiar archivo entero" })
keymap("x", "<leader>p", [["_dP]], { desc = "Pegar sticky" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover bloque abajo" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover bloque arriba" })

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

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
