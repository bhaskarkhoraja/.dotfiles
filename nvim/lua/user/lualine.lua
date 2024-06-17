local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local lualine = require("lualine")

  -- stylua: ignore
  local colors = {
    blue     = '#80a0ff',
    cyan     = '#79dac8',
    black    = '#080808',
    white    = '#c6c6c6',
    red      = '#ff5189',
    violet   = '#d183e8',
    grey     = '#303030',
    green    = '#98be65',
    orange   = '#e17800',
    yellow   = '#ECBE7B',
    darkblue = '#081633',
    magenta  = '#c678dd',
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local config = {
    options = {
      -- theme = bubbles_theme,
      component_separators = "|",
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    tabline = {},
    extensions = {},
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  ins_left({
    -- mode
    "mode",
    separator = { left = "" },
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.blue,
        i = colors.red,
        v = colors.cyan,
        [""] = colors.red,
        V = colors.red,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      return { bg = mode_color[vim.fn.mode()], fg = colors.darkblue }
    end,
  })

  ins_left({
    -- filesize component
    "filesize",
    separator = { right = "" },
    cond = conditions.buffer_not_empty,
    color = { fg = colors.blue, bg = colors.grey },
  })

  --[[ ins_left({ ]]
  --[[ 	"filename", ]]
  --[[ 	separator = { right = "" }, ]]
  --[[ 	cond = conditions.buffer_not_empty, ]]
  --[[ 	color = { fg = colors.magenta, gui = "bold", bg = colors.grey }, ]]
  --[[ }) ]]

  ins_left({
    "diagnostics",
    separator = { right = "" },
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
    color = { bg = colors.grey },
  })

  ins_left({
    "diff",
    separator = { right = "" },
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
    color = { bg = colors.grey },
  })

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  --[[ ins_left({
	function()
		return "%="
	end,
})

ins_left({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " ",
	separator = { right = "", left = "" },
	color = { fg = colors.yellow, gui = "bold", bg = colors.grey },
}) ]]

  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_right( {
		function()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
		end,
		icon = " ",
    separator = { left = "" },
    color = { fg = colors.cyan, gui = "bold", bg = colors.grey },
	})

  ins_right({
    "filetype",
    cond = conditions.hide_in_width,
    color = { fg = colors.blue, gui = "bold", bg = colors.grey },
  })

  ins_right({
    function()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = " ",
    color = { fg = colors.yellow, gui = "bold", bg = colors.grey },
  })

  ins_right({
    "o:encoding",     -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold", bg = colors.grey },
  })

  -- ins_right({
  --   "fileformat",
  --   fmt = string.upper,
  --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  --   color = { fg = colors.green, gui = "bold", bg = colors.grey },
  -- })

  ins_right({
    "branch",
    icon = "",
    color = { fg = colors.red, gui = "bold", bg = colors.grey },
  })

  ins_right({
    "progress",
    padding = { right = 2 },
    color = { fg = colors.white, gui = "bold", bg = colors.grey },
  })

  ins_right({
    "location",
    separator = { right = "" },
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.blue,
        i = colors.red,
        v = colors.cyan,
        [""] = colors.red,
        V = colors.red,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      return { bg = mode_color[vim.fn.mode()], fg = colors.darkblue }
    end,
  })
  -- Now don't forget to initialize lualine
  lualine.setup(config)
end

return M
