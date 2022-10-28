local ok, headlines = pcall(require, "headlines")
if not ok then
    return
end

headlines.setup {
    markdown = {
        fat_headlines = true,
        fat_headline_upper_string = "",
        fat_headline_lower_string = ""
    },
}
