# Configuración de Neovim

Configuración personal de Neovim con tema Catppuccin, explorador de archivos, búsqueda fuzzy y soporte LSP para Python y Rust.

## Requisitos Previos

### 1. Instalar Neovim

**Sitio oficial:** https://neovim.io/

#### macOS
```bash
brew install neovim
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install neovim
```

#### Linux (Fedora)
```bash
sudo dnf install neovim
```

#### Linux (Arch)
```bash
sudo pacman -S neovim
```

#### Windows
```powershell
winget install Neovim.Neovim
```
O descarga el instalador desde: https://github.com/neovim/neovim/releases

### 2. Instalar Git

Git es necesario para el gestor de plugins.

#### macOS
```bash
brew install git
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install git
```

#### Windows
```powershell
winget install Git.Git
```

### 3. Instalar una Nerd Font

Los iconos requieren una fuente con soporte de iconos. Recomendado: **JetBrainsMono Nerd Font**

Descarga desde: https://www.nerdfonts.com/font-downloads

Configura la fuente en tu terminal después de instalarla.

### 4. Instalar fd (opcional pero recomendado)

Necesario para la búsqueda de directorios (`<leader>fd`).

#### macOS
```bash
brew install fd
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install fd-find
```

#### Linux (Arch)
```bash
sudo pacman -S fd
```

#### Windows
```powershell
winget install sharkdp.fd
```

### 5. Instalar ripgrep (opcional pero recomendado)

Mejora la búsqueda de texto en archivos.

#### macOS
```bash
brew install ripgrep
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install ripgrep
```

#### Windows
```powershell
winget install BurntSushi.ripgrep
```

## Instalación de la Configuración

### macOS / Linux

```bash
# Respaldar configuración existente (si existe)
mv ~/.config/nvim ~/.config/nvim.backup

# Clonar este repositorio
git clone https://github.com/TU_USUARIO/TU_REPO.git ~/.config/nvim

# Abrir Neovim (los plugins se instalarán automáticamente)
nvim
```

### Windows

```powershell
# Respaldar configuración existente (si existe)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup

# Clonar este repositorio
git clone https://github.com/TU_USUARIO/TU_REPO.git $env:LOCALAPPDATA\nvim

# Abrir Neovim (los plugins se instalarán automáticamente)
nvim
```

## Atajos de Teclado (Remap)

La tecla líder es **Espacio**.

| Atajo | Modo | Acción |
|-------|------|--------|
| `<Space>e` | Normal | Abrir/cerrar explorador de archivos |
| `<Shift>l` | Normal | Siguiente pestaña |
| `<Shift>h` | Normal | Pestaña anterior |
| `<Space>x` | Normal | Cerrar pestaña actual |
| `<Ctrl>w w` | Normal | Saltar entre paneles |
| `<Space>ff` | Normal | Buscar archivos en el proyecto |
| `<Space>fg` | Normal | Buscar texto dentro de archivos |
| `<Space>fb` | Normal | Buscar entre pestañas abiertas |
| `<Space>fs` | Normal | Buscar archivos en todo el sistema |
| `<Space>fd` | Normal | Buscar directorios (requiere fd) |

## Plugins Incluidos

| Plugin | Descripción |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Gestor de plugins |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Pantalla de inicio con citas |
| [catppuccin](https://github.com/catppuccin/nvim) | Tema de colores (Mocha) |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | Explorador de archivos |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | Pestañas visuales |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Resaltado de sintaxis avanzado |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Configuración LSP |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Instalador de LSP/formatters |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formateo automático |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Búsqueda fuzzy |

## Configuración LSP

Esta configuración incluye soporte para:

### Python
- LSP: `pyright`
- Formatter: `black`

Para instalar las herramientas:
```bash
# Instalar pyright
npm install -g pyright

# Instalar black
pip install black
```

### Rust
- LSP: `rust_analyzer`
- Formatter: `rustfmt`

Para instalar las herramientas:
```bash
# Instalar rustup (incluye rustfmt)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# rust-analyzer se instala con:
rustup component add rust-analyzer
```

También puedes usar `:Mason` dentro de Neovim para instalar los servidores LSP gráficamente.

## Características

- **Pantalla de inicio personalizada** con citas filosóficas aleatorias
- **Tema Catppuccin Mocha** (colores oscuros)
- **Guardado automático** al cambiar de archivo
- **Formateo automático** al guardar (Python y Rust)
- **Explorador de archivos** con iconos
- **Pestañas visuales** con separadores

## Estructura de Archivos

```
~/.config/nvim/
├── init.lua              # Punto de entrada
├── lazy-lock.json        # Versiones de plugins
└── lua/
    └── xtef/
        ├── init.lua      # Configuración de plugins
        ├── remap.lua     # Atajos de teclado
        └── citas.lua     # Citas para pantalla de inicio
```

## Personalización

### Cambiar el tema
En `lua/xtef/init.lua`, modifica:
```lua
vim.cmd.colorscheme("catppuccin-mocha")
```
Opciones: `catppuccin-latte`, `catppuccin-frappe`, `catppuccin-macchiato`, `catppuccin-mocha`

### Agregar citas
Edita `lua/xtef/citas.lua` o presiona `v` en la pantalla de inicio.

### Agregar soporte LSP para otros lenguajes
1. Agrega la configuración en `lua/xtef/init.lua`:
```lua
vim.lsp.config('nombre_del_lsp', {})
vim.lsp.enable('nombre_del_lsp')
```
2. Instala el LSP con `:Mason`
