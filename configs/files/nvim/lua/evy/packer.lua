-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use ({
        'AlexvZyl/nordic.nvim',
        as = 'nordic',
        config = function()
            vim.cmd('colorscheme nordic')
        end
    })

    use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use( 'mbbill/undotree' )
    use( 'tpope/vim-fugitive' )
end
