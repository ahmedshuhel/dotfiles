local db = require("dap-buddy")

local function config()
  db.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    verbosely_call_debuggers = false,
  })
end

return {
  config = config
}
