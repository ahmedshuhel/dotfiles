local colors = require("colors")

local function config()
  local bufferline = require("bufferline")
  local hiddenft = { "qf", "fugitive", "fugitiveblame", "help" }

  bufferline.setup({
    options = {
      offsets = { { filetype = "NvimTree", text = "" }, { filetype = "dbui", text = "" } },
      buffer_close_icon = "",
      modified_icon = "",
      close_command = "BufDel! %d",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      show_buffer_close_icons = true,
      separator_style = "thin",
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number)
        -- filter out filetypes you don't want to see
        if not vim.tbl_contains(hiddenft, vim.bo[buf_number].filetype) then
          return true
        end
        -- filter out by buffer name
        -- if vim.fn.bufname(buf_number) ~= "qf" then
        --   return true
        -- end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --   return true
        -- end
      end,
    },
    highlights = {
      fill = {
        guifg = colors.grey_fg,
        guibg = colors.black2,
      },
      background = {
        guifg = colors.grey_fg,
        guibg = colors.black2,
      },
      -- buffers
      buffer_visible = {
        guifg = colors.light_grey,
        guibg = colors.black2,
      },
      buffer_selected = {
        guifg = colors.white,
        guibg = colors.black,
        gui = "bold",
      },
      -- tabs
      tab = {
        guifg = colors.light_grey,
        guibg = colors.one_bg3,
      },
      tab_selected = {
        guifg = colors.black2,
        guibg = colors.nord_blue,
      },
      tab_close = {
        guifg = colors.red,
        guibg = colors.black,
      },
      indicator_selected = {
        guifg = colors.black,
        guibg = colors.black,
      },
      -- separators
      separator = {
        guifg = colors.black2,
        guibg = colors.black2,
      },
      separator_visible = {
        guifg = colors.black2,
        guibg = colors.black2,
      },
      separator_selected = {
        guifg = colors.black2,
        guibg = colors.black2,
      },
      -- modified
      modified = {
        guifg = colors.red,
        guibg = colors.black2,
      },
      modified_visible = {
        guifg = colors.red,
        guibg = colors.black2,
      },
      modified_selected = {
        guifg = colors.green,
        guibg = colors.black,
      },
      -- close buttons

      close_button = {
        guifg = colors.light_grey,
        guibg = colors.black2,
      },
      close_button_visible = {
        guifg = colors.light_grey,
        guibg = colors.black2,
      },
      close_button_selected = {
        guifg = colors.red,
        guibg = colors.black,
      },
    },
  })
end

return {
  config = config,
}
