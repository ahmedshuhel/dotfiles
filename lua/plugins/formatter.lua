local M = {}

M.config = function()

  require('formatter').setup({
    logging = false,
    filetype = {
      javascript = {
          -- prettier
         function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
              stdin = true
            }
          end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
      },
      python = {
          -- Black-format
         function()
            return {
              exe = "black",
              args = { '-q', '-' },
              stdin = true,
              cwd = vim.fn.expand('%:p:h')
            }
          end
      }
    }
  })
end

return M


