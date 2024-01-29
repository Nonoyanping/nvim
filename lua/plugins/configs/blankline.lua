local opts = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

return opts


-- For further configuration see `:help indent_blankline.txt`
-- local status_ok, indent = pcall(require, "indent_blankline")
-- if not status_ok then
-- 	return
-- end
-- local function get_char_highlights()
-- 	if status_ok then
-- 		vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]])
-- 		vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]])
-- 		vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]])
-- 		vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]])
-- 		vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]])
-- 		vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]])
-- 		return {
-- 			"IndentBlanklineIndent1",
-- 			"IndentBlanklineIndent2",
-- 			"IndentBlanklineIndent3",
-- 			"IndentBlanklineIndent4",
-- 			"IndentBlanklineIndent5",
-- 			"IndentBlanklineIndent6",
-- 		}
-- 	else
-- 		return {}
-- 	end
-- end
--
-- indent.setup({
-- 	-- for example, context is off by default, use this to turn it on
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	char = "¦", -- [['|', '¦', '┆', '┊', "┊"]]
-- 	show_trailing_blankline_indent = false,
-- 	-- show_end_of_line = true,
-- 	space_char_blankline = " ",
-- 	char_highlight_list = get_char_highlights(),
-- })
