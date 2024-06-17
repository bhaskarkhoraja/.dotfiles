local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
}

function M.config()
  -- local highlight = {
  --     "RainbowRed",
  -- }
  -- local hooks = require "ibl.hooks"
  -- -- create the highlight groups in the highlight setup hook, so they are reset
  -- -- every time the colorscheme changes
  -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  -- end)
  -- vim.g.rainbow_delimiters = { highlight = highlight }
  require("ibl").setup({
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			injected_languages = true,
			priority = 500,
      -- highlight = highlight,
		},
  })
end

return M

