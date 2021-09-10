local api = vim.api
local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {"NvimTree", "dbui", "fugitiveblame", "toggleterm", "terminal", "zsh"}

local global_theme = "themes/" .. vim.g.dp_theme
local colors = require(global_theme)


gls.left[1] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.statusline_bg}
    }
}


gls.left[2] = {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = {colors.grey_fg2, colors.statusline_bg},
    }
}



local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
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
        provider = function() return "  " end,
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

_G.toggle_statusline = function()
    local hidden = {
       "help",
       "dashboard",
    }

    local buftype = api.nvim_buf_get_option("%", "ft")
    if vim.tbl_contains(hidden, buftype) then
       api.nvim_set_option("laststatus", 0)
       return
    else
       api.nvim_set_option("laststatus", 2)
    end
end

vim.cmd([[
  augroup statuslinegroup
    autocmd!
    autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua toggle_statusline()
  augroup END
]], false)
