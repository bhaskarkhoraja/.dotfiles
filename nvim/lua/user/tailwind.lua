local M = {
  "luckasRanarison/tailwind-tools.nvim", -- TODO: Not working
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
}

function M.config()
  require("tailwind-tools").setup({})
end

return M
