local M = {}

M.treesitter = {
  ensure_installed = {
    "markdown",
    "lua",
    "python",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "pyright",
  },
}

M.cmp = function ()
  return {
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
  }
end

return M
