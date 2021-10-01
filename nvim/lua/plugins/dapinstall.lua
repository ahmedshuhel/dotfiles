local di = require("dap-install")

local function config()
  di.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    verbosely_call_debuggers = false,
  })
end

return {
  config = config
}
