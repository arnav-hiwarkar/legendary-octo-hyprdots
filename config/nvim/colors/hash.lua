local function apply()
  package.loaded.hash_palette = nil
  local ok, palette = pcall(require, "hash_palette")
  if ok then
    require("base16-colorscheme").setup(palette)
    vim.g.colors_name = "hash"
  end
end
apply()
vim.api.nvim_create_autocmd("FocusGained", {
  group = vim.api.nvim_create_augroup("hash_palette_refresh", { clear = true }),
  callback = function() if vim.g.colors_name == "hash" then apply() end end,
})
