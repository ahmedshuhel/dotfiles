local dap_install = require("dap-install")

local function config()
    dap_install.setup({
       installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
       verbosely_call_debuggers = false,
    })
end

return {
  config = config
}
