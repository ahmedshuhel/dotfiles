local ok, bqf = pcall(require, "bqf")
if not ok then
    return
end

bqf.setup {
    preview = {
        auto_preview = false,
        win_height = 5,
        win_vheight = 5,
    },
    auto_resize_height = {
        default = false,
    },
}
