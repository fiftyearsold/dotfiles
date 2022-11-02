local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- Lua
  b.formatting.stylua,

  -- python
  b.formatting.autopep8,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
