local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
  return
end

toggleterm.setup {
  size = function (term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  direction = "float",
  shade_terminals = true,
  shading_factor = 3,
  persist_size = true,
  start_in_insert = false,
  insert_mappings = true,
  auto_scroll = true,
  shade_filestypes = {},
  float_opts = {
    border = 'single',
    highlight = {
      broder = "Normal",
      background = "Normal",
    },
  },
}
