local execute = vim.api.nvim_command
local fn = vim.fn
vim.cmd [[packadd packer.nvim]]

-- Install packer if it isn't already installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim ")
    execute("packadd packer.nvim")
end

-- Installing/Initializing all the plugins
return require("packer").startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim"}
    use {"kabouzeid/nvim-lspinstall"}

    -- Stuff for editing
    use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    use {"sbdchd/neoformat"}
    use {"norcalli/nvim-colorizer.lua"}
    use {"junegunn/goyo.vim"}
    use {"junegunn/limelight.vim"}
	  use {'folke/which-key.nvim'}
    use {'hoob3rt/lualine.nvim'}
		use {'akinsho/nvim-bufferline.lua'}

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-media-files.nvim"}

    -- Debugging
    use {"mfussenegger/nvim-dap"}

    -- Autocomplete
    use {"hrsh7th/nvim-compe"}
    use {"hrsh7th/vim-vsnip"}
    use {"rafamadriz/friendly-snippets"}
    use {"alvan/vim-closetag"}

    -- Markdown
    use {"godlygeek/tabular"}
    use {"plasticboy/vim-markdown"}
		use {"Pocco81/TrueZen.nvim"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag"}

    -- Explorer
    use "kyazdani42/nvim-tree.lua"
    use "kevinhwang91/rnvimr"

    use {"lewis6991/gitsigns.nvim"}
    use {"glepnir/dashboard-nvim"}
    use {"windwp/nvim-autopairs"}
    use {"terrortylor/nvim-comment"}
    use {"kevinhwang91/nvim-bqf"}

    -- Color
    use 'folke/tokyonight.nvim'

    -- Icons
    use {"kyazdani42/nvim-web-devicons"}
    use {"ryanoasis/vim-devicons"}
end)
