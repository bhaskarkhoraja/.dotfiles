local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function M.config()
  local devicons = require("nvim-web-devicons")

  devicons.set_icon({
    sh = {
      icon = "",
      color = "#1DC123",
      cterm_color = "59",
      name = "Sh",
    },
    [".gitattributes"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "59",
      name = "GitAttributes",
    },
    [".gitconfig"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "59",
      name = "GitConfig",
    },
    [".gitignore"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "59",
      name = "GitIgnore",
    },
    [".gitlab-ci.yml"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "166",
      name = "GitlabCI",
    },
    [".gitmodules"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "59",
      name = "GitModules",
    },
    ["diff"] = {
      icon = "",
      color = "#e24329",
      cterm_color = "59",
      name = "Diff",
    },
    ["cshtml"] = {
      icon = "",
      color = "#e44d26",
      cterm_color = "202",
      name = "Cshtml",
    },
    ["cs"] = {
      icon = devicons.get_icon_colors_by_filetype("cs"),
      color = "#BD9A68",
      cterm_color = "59",
      name = "Cs",
    },
    ["csproj"] = {
      icon = "",
      color = "#BD9A68",
      cterm_color = "59",
      name = "Csproj",
    },
    [".env.local"] = {
      icon = "",
      color = "#faf743",
      cterm_color = "226",
      name = "LocalEnv",
    },
    [".env.example"] = {
      icon = "",
      color = "#faf743",
      cterm_color = "226",
      name = "LocalEnv",
    },
    ["tsx"] = {
      icon = "",
      color = "#20c2e3",
      cterm_color = "26",
      name = "Tsx",
    },
    ["yuck"] = {
      icon = "",
      color = "#F39C12",
      cterm_color = "26",
      name = "Yuck",
    },
    ["properties"] = {
      icon = "",
      color = "#51A0CF",
      cterm_color = "59",
      name = "Properties",
    },
    ["properties.example"] = {
      icon = "",
      color = "#51A0CF",
      cterm_color = "59",
      name = "PropertiesExample",
    },
    [".prettierignore"] = {
      icon = "",
      color = "#51A0CF",
      cterm_color = "59",
      name = "PrettierIgnore",
    },
  })

  devicons.set_default_icon("󰈙", "#F39C12")
end

return M
