local fns = require "maq.funcs"
local ok, neodim = pcall(require, "neodim")
if not ok then
    return
end

neodim.setup {
    alpha = 0.5,
    blend_color = "#10171f",
    hide = {
        virtual_text = true,
        signs = true,
        underline = true,
    },
}
