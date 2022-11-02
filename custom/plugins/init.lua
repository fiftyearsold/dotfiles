local overrides = require "custom.plugins.overrides"

return {

  -- Install plugin
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    tag = 'v2.*',
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },

   ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Override plugin definition options

  -- Override plugin config
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

   ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp
  },

  -- remove plugin
  ["NvChad/nvterm"] = false

}

