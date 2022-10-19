local fn = vim.fn

-- Automatically install packer
local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end


packer.init {
    -- Have packer use a popup window
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "gruvbox-community/gruvbox"

    use "numToStr/Comment.nvim"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use "p00f/nvim-ts-rainbow"
    use "windwp/nvim-ts-autotag"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "phaazon/hop.nvim"

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "ray-x/lsp_signature.nvim"
    }

    use "L3MON4D3/LuaSnip"

    use "windwp/nvim-autopairs"

    use "jose-elias-alvarez/null-ls.nvim"


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end

end)
