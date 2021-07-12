local opt = vim.opt

opt.showmode = false
opt.ruler = false
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 200
opt.clipboard = "unnamedplus"
opt.showmatch = true
opt.linebreak = true
opt.completeopt = "menuone,noselect"
opt.autochdir = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files
--"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
opt.autoread = true
--"自动保存
opt.autowrite = true
--"增强撤销
opt.undofile = true
opt.fileformats = 'unix'
opt.encoding = 'utf-8'

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- for indenline
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
--使用与上一行同样的缩进
--opt.autoindent = true

-- Folding
opt.foldenable = true
opt.foldlevelstart = 3
opt.foldnestmax = 10
opt.foldmethod = "indent"

-- disable builtin vim plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

-- file extension specific tabbing
vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]])

return M
