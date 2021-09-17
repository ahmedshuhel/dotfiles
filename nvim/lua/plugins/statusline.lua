local api = vim.api
local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

local global_theme = "themes/" .. vim.g.dp_theme
local colors = require(global_theme)

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end


local function config()
  gl.short_line_list = {"NvimTree", "dbui", "fugitiveblame", "toggleterm", "terminal", "zsh"}

  gls.left[1] = {
    LeftPadding = {
      provider = function() return " " end,
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }


  gls.left[2] = {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }


  gls.left[3] = {
    FileName = {
      provider = {"FileName"},
      condition = condition.buffer_not_empty,
      highlight = {colors.grey_fg2, colors.statusline_bg},
    }
  }


  gls.left[4] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = checkwidth,
      icon = "  ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.left[5] = {
    DiffModified = {
      provider = "DiffModified",
      condition = checkwidth,
      icon = "   ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.left[6] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = checkwidth,
      icon = "  ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.left[7] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors.red, colors.statusline_bg}
    }
  }

  gls.left[8] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.yellow, colors.statusline_bg}
    }
  }

  gls.right[1] = {
    lsp_status = {
      provider = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) ~= nil then
          return " " .. "  " .. " LSP "
        else
          return ""
        end
      end,
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.right[2] = {
    GitIcon = {
      provider = function() return " " end,
      condition = require("galaxyline.condition").check_git_workspace,
      highlight = {colors.grey_fg2, colors.statusline_bg},
      separator = " ",
      separator_highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.right[3] = {
    GitBranch = {
      provider = "GitBranch",
      condition = require("galaxyline.condition").check_git_workspace,
      highlight = {colors.grey_fg2, colors.statusline_bg},
      separator = " ",
      separator_highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }

  gls.right[4] = {
    RightPadding = {
      provider = function() return " " end,
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }


  gls.short_line_left[1] = {
    BufferType = {
      provider = function () return "" end,
      separator = ' ',
      separator_highlight = {'NONE', colors.statusline_bg},
      highlight = {colors.blue, colors.statusline_bg, 'bold'}
    }
  }
end

return {
  config = config
}
