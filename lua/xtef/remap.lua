vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Explorador: Espacio + e
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Navegar pestañas: Shift + l (derecha) / Shift + h (izquierda)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })

-- Cerrar pestaña: Espacio + x
keymap("n", "<leader>x", ":bdelete<CR>", { silent = true })

-- Saltar entre paneles (Explorador <-> Código): Ctrl + w + w
keymap("n", "<C-w><C-w>", "<C-w>w")

-- ff = Buscar archivos
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })

-- fg = Buscar texto dentro de un proyecto
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto en proyecto" })

-- fl = Buscar texto dentro del archivo actual
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buscar texto en archivo actual" })

-- fb = Buscar entre archivos abiertos
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buscar pestañas" })

-- Para las funciones personalizadas (fs y fd), usamos una función anónima 
-- que haga el require solo cuando se ejecute el comando:

-- fs = Buscar archivos en todo el sistema ($HOME)
vim.keymap.set("n", "<leader>fs", function()
    require('telescope.builtin').find_files({ cwd = vim.fn.expand("$HOME") })
end, { desc = "Buscar archivos en todo el sistema" })

-- fd = Buscar directorios en todo el sistema
vim.keymap.set("n", "<leader>fd", function()
    require('telescope.builtin').find_files({
        cwd = vim.fn.expand("$HOME"),
        find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
    })
end, { desc = "Buscar carpetas en todo el sistema" })
keymap("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Abrir panel Copilot" })
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Abrir LazyGit" })
