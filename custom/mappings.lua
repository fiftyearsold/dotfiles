local M = {}

M.disabled = {
  n = {
  }
}

M.general = {
  n = {
    ["<C-q>"] = { "<cmd> q <CR>", "close window" },
  }
}

M.toggleterm = {
  n = {
    ["<leader>p"] = { "<cmd> TermExec cmd='! python %' <CR>"},
  }
}

return M
