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

-- FZF
-- ff = Buscar archivos
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Buscar archivos" })
-- fg = Buscar texto dentro de los archivos
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Buscar texto" })
-- fb = Buscar entre archivos abiertos
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buscar pestañas" })
-- fs = Buscar archivos en todo el sistema"
keymap("n", "<leader>fs", function() 
    require('fzf-lua').files({ cwd = vim.fn.expand("$HOME") }) 
end, { desc = "Buscar archivos en todo el sistema" })
-- fd = Buscar directorios (hace falta tener fd instalado)
keymap("n", "<leader>fd", function()
    require('fzf-lua').files({ 
        cwd = vim.fn.expand("$HOME"),
        cmd = "fd --type d --hidden --exclude .git" 
    })
end, { desc = "Buscar carpetas en todo el sistema" })