local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- [[ Highlight on yank ]]
-- See `<cmd>help vim.highlight.on_yank()`
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
    end,
    group = augroup("YankHighlight", { clear = true }),
    pattern = "*",
})


-- TODO: [[ Toggle Transparancy ]]

-- TODO: [[ Dont's expand tab in makefile ]]


-- TODO: Remove white space at end of line
autocmd("BufWritePre", {
	group = augroup("yanp", { clear = true }),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
