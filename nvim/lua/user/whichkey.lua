local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    {"<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    {"<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    {"<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
    {"<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    {"<leader>b", name = "Buffers" },
    {"<leader>d", name = "Debug" },
    {"<leader>f", name = "Find" },
    {"<leader>g", name = "Git" },
    {"<leader>l", name = "LSP" },
    {"<leader>p", name = "Plugins" },
    {"<leader>t", name = "Test" },
    {"<leader>T", name = "Treesitter" },
    -- a = {
    --   name = "Tab",
    --   n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
    --   N = { "<cmd>tabnew %<cr>", "New Tab" },
    --   o = { "<cmd>tabonly<cr>", "Only" },
    --   h = { "<cmd>-tabmove<cr>", "Move Left" },
    --   l = { "<cmd>+tabmove<cr>", "Move Right" },
    -- },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n"
  }

  which_key.add(mappings, opts)
end

return M

