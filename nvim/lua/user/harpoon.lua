local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local harpoon = require("harpoon")
  harpoon.setup()

  local conf = require("telescope.config").values
  function M.toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
      }):find()
  end

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<leader>a", "<cmd>lua require('harpoon'):list():add()<cr>", opts)
  keymap("n", "<C-e>", "<cmd>lua require('user.harpoon').toggle_telescope(require('harpoon'):list())<cr>", opts)


  keymap("n", "<C-h>", "<cmd>lua require('harpoon'):list():select(1)<cr>", opts)
  keymap("n", "<C-t>", "<cmd>lua require('harpoon'):list():select(2)<cr>", opts)
  keymap("n", "<C-n>", "<cmd>lua require('harpoon'):list():select(3)<cr>", opts)
  keymap("n", "<C-s>", "<cmd>lua require('harpoon'):list():select(4)<cr>", opts)

  keymap("n", "<C-S-P>", "<cmd>lua require('harpoon'):list():prev()<cr>", opts)
  keymap("n", "<C-S-N>", "<cmd>lua require('harpoon'):list():next()<cr>", opts)

end

return M
