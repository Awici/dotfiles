vim.cmd [[syntax enable]]
vim.cmd [[syntax on]]

-- -- Theme settings
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- -- Enables the theme
vim.cmd ("colorscheme " .. O.colorscheme)

-- local base16 = require "base16"
-- base16(base16.themes["material-darker"], true)
-- vim.g.material_style = 'deep ocean'
-- require('material').set()