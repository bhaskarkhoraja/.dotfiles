local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}


function M.config()
	local servers = {
		"lua_ls",
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"sqlls",
    "eslint",
		"jsonls"
	}

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
		automatic_installation = true, -- Install the server if not installed properly
  }
end

return M
