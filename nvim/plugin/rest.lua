local ok, rest = pcall(require, "rest-nvim")

if not ok then
    return
end

local f = require "maq.funcs"

rest.setup {
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = true,
    -- Highlight request on run
    highlight = {
        enabled = true,
        timeout = 150,
    },
    -- Jump to request line on run
    jump_to_request = false,
}

f.map("n", "<Leader>ch", "[[:lua require('rest-nvim').run()<CR>]]")
f.map("n", "<Leader>cp", [[:lua require('rest-nvim').run(true)<CR>)]])
f.map("n", "<Leader>cl", [[:lua require('rest-nvim').last()<CR>]])
