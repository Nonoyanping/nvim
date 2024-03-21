local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

----------------------------------- globals --------------------------------------
-- g.lang = 'en_US'
vim.cmd [[let $LANG = 'en_US']]
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

----------------------------------- options --------------------------------------
-- NOTE: Set your shell to powershell
local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
-- opt.expandtab = true -- TODO change to false when writing a makefile
opt.expandtab = false -- TODO change to false when writing a makefile
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 250

opt.undofile = true

-- transparency
opt.pumblend = 15
opt.winblend = 20

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some default providers
-- for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
--   vim.g["loaded_" .. provider .. "_provider"] = 0
-- end
for _, provider in ipairs { "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-------------------------------------- autocmds -----------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- reload some chadrc options on-save
autocmd("BufWritePost", {
    pattern = vim.tbl_map(function(path)
        return vim.fs.normalize(vim.loop.fs_realpath(path))
        -- end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua", true, true, true)),
    end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/core/*.lua", true, true, true)),

    group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

    callback = function(opts)
        local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]

        -- ++++++++++++++++++++++++++++++++++++++++++++++++++
        -- vim.notify("Variable fp:" .. fp)
        -- ++++++++++++++++++++++++++++++++++++++++++++++++++

        local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
        local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

        -- ++++++++++++++++++++++++++++++++++++++++++++++++++
        -- vim.notify("Variable module:" .. module)
        -- ++++++++++++++++++++++++++++++++++++++++++++++++++

        require("plenary.reload").reload_module "base46"
        require("plenary.reload").reload_module(module)
        require("plenary.reload").reload_module "custom.chadrc"
        require("plenary.reload").reload_module "custom.test"

        config = require("core.utils").load_config()

        vim.g.nvchad_theme = config.ui.theme
        vim.g.transparency = config.ui.transparency

        -- statusline
        require("plenary.reload").reload_module("nvchad.statusline." .. config.ui.statusline.theme)
        vim.opt.statusline = "%!v:lua.require('nvchad.statusline." .. config.ui.statusline.theme .. "').run()"

        -- tabufline
        if config.ui.tabufline.enabled then
            require("plenary.reload").reload_module "nvchad.tabufline.modules"
            vim.opt.tabline = "%!v:lua.require('nvchad.tabufline.modules').run()"
        end

        require("base46").load_all_highlights()
        -- vim.cmd("redraw!")

        vim.notify("base46 " .. " reload!")
        vim.notify("module: " .. module .. " reload!")
        vim.notify("custom.chadrc " .. " reload!")
        require("plenary.reload").reload_module "custom.test"
    end,
})

---------------------------------- commands --------------------------------------
local user_cmd = vim.api.nvim_create_user_command

-- Update Neovim
user_cmd("NvimUpdate", function()
    require "nvchad.updater"()
end, {})

------------------------- Further Configuration -------------------------
-- TODO: further configuration

-- something cool
-- opt.list = true
-- opt.listchars:append("eol:↴")
-- opt.listchars:append("space:･")
-- o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- make popup background transparent
-- opt.pumblend = 15
-- opt.winblend = 20

-- Set cursorhold updatetime(:  .
-- vim.g.cursorhold_updatetime = 100

--[[ -- Set signcolumn width to 2.
-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.opt.signcolumn = "yes:2"
autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
}) ]]

-- Setting completion menu height.
-- opt.pumheight = 25 -- pop up menu height.

-- Set searching stuf.
-- opt.hlsearch = true
-- opt.incsearch = true
-- opt.ignorecase = true

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
-- opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
-- opt.shortmess = vim.opt.shortmess + { c = true }
-- api.nvim_set_option("updatetime", 300)

--[[
opt.backspace = "indent,eol,start"
opt.ambiwidth = "single"
opt.wildmenu = true
opt.cmdheight = 1
opt.showcmd = true
opt.hlsearch = true
opt.hidden = true
opt.backup = true
opt.backupdir = os.getenv("HOME") .. '/.vim/backup'
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true
opt.wrap = false
opt.nrformats = "bin,hex"
opt.swapfile = false
opt.formatoptions:remove('t')
opt.formatoptions:append('mM')
]]

-- opt.autowrite = true -- Enable auto write
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 3 -- Hide * markup for bold and italic
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.incsearch = true
-- opt.list = true -- Show some invisible characters (tabs...
-- opt.relativenumber = true -- Relative line numbers
-- opt.scrolloff = 5 -- Lines of context
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 4 -- Size of an indent
-- opt.shortmess:append { W = true, I = true, c = true }
-- opt.showmode = false -- Dont show mode since we have a statusline
-- opt.sidescrolloff = 8 -- Columns of context
-- opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- opt.smartcase = true -- Don't ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = { "en" }
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitright = true -- Put new windows right of current
-- opt.tabstop = 4 -- Number of spaces tabs count for
-- opt.termguicolors = true -- True color support
-- opt.timeoutlen = 150
-- opt.undofile = true
-- opt.undolevels = 10000
-- opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width
-- opt.wrap = false -- Disable line wrap

