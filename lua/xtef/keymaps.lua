local keymap = vim.keymap.set

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")

keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap("n", "<leader>ya", [[:%y+<CR>]])
keymap("x", "<leader>p", [["_dP]])

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

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
