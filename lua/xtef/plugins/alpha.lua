return {
    "goolord/alpha-nvim",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        local status_ok, citas = pcall(require, "xtef.citas")
        if status_ok then
            dashboard.section.header.val = citas.get_header()
            dashboard.section.header.opts.hl = "String"
            dashboard.section.header.opts.position = "center"
        end

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar Archivo", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recientes", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Buscar Texto", ":Telescope live_grep<CR>"),
            dashboard.button("v", "󱄔  Editar Citas", ":e ~/.config/nvim/lua/xtef/citas.lua<CR>"),
            dashboard.button("c", "  Configuración", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
        }
        require("alpha").setup(dashboard.opts)
    end
}
