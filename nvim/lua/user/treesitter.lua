local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		"windwp/nvim-ts-autotag",
	},
}

function M.config()
	local filetypes = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"tsx",
		"jsx",
		"php",
		"phpdoc",
		"markdown",
	}

	local skip_tags = {
		"area",
		"base",
		"br",
		"col",
		"command",
		"embed",
		"hr",
		"img",
		"slot",
		"input",
		"keygen",
		"link",
		"meta",
		"param",
		"source",
		"track",
		"wbr",
		"menuitem",
	}
  require("nvim-treesitter.configs").setup {
		ensure_installed = {
			"lua",
			"typescript",
			"javascript",
			"html",
			"css",
			"scss",
			"bash",
			"comment",
			"fish",
			"json",
			"sql",
			"tsx",
			"yuck",
			"markdown_inline",
			"query",
			"gitignore",
		},
    indent = { enable = true },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
				include_surrounding_whitespace = true,
			},
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
  }

  require("nvim-treesitter.install").prefer_git = true

	require("nvim-ts-autotag").setup({
    opts = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
      filetyes = filetypes,
      skip_tags = skip_tags,
    }
  })

	require("treesitter-context").setup({
		enable = true,
		max_lines = 0,
		trim_scope = "outer",
		min_window_height = 0,
		line_number = true,
	})
end

return M
