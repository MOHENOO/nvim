local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

map("n", "<C-s>", ":w <CR>", opt)
map("n", "<Leader>:","<Cmd> Telescope commands<CR>", opt)
map("n", "K","<Cmd>lua vim.lsp.buf.hover()<CR>", opt)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opt)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)

-- compe stuff
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

--  compe mappings
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})

wk.register({
  b = {
      name = "buffer",
      b = { "<Cmd>Telescope buffers<CR>", "Find buffer"},
  },
  d = {
      name = "dashboard",
      d = { "<Cmd> Dashboard<CR>", "open"},
      l = { "<Cmd> SessionLoad<CR>", "Session load"},
      s = { "<Cmd> SessionSave<CR>", "Session save"},
  },
  f = {
      name = "file",
      f = { "<Cmd>Telescope find_files <CR>", "Find file"},
      r = { "<Cmd>Telescope oldfiles<CR>", "Open Recent File"},
      n = { "<cmd>enew<cr>", "New File" },
      m = { "<Cmd> Neoformat<CR>", "Fine format"},
  },
  g = {
    name = "git",
    s = { "<Cmd> Telescope git_status <CR>", "Git status"},
    m = { "<Cmd> Telescope git_commits <CR>", "Git commits"},
  },
  t = {
    name = "tab", -- optional group name
    c = { ":tabnew<CR>", "New Tab"},
    n = { "<Cmd>BufferLineCycleNext<CR>", "Next tab" }, -- create a binding with label
    p = { "<Cmd>BufferLineCyclePrev<CR>", "Prev tab" }, -- additional options for creating the keymap
    x = { ":bd!<CR>", "Close tab"},
  },
  s = {
    name = "search",
    b = { "<Cmd>Telescope buffers<CR>", "Search buffer"},
    f = { "<Cmd>Telescope find_files <CR>", "Search file"},
    F = { "<Cmd>Telescope oldfiles<CR>", "Search oldfiles"},
    h = { "<Cmd>Telescope help_tags<CR>", "Search help"},
    w = { "<Cmd> Telescope live_grep<CR>", "Search word"},
    T = { "<Cmd> Telescope tags<CR>", "Search tags"},
    c = { "<Cmd> Telescope commands<CR>", "Search commands"},
    k = { "<Cmd> Telescope keymaps<CR>", "Search keymaps"},
    s = { "<Cmd> Telescope lsp_workspace_symbols<CR>", "Search symbols"},
    t = { "<Cmd> Telescope treesitter<CR>", "Search treesitter"},
  },
  z = {
      name = "zoom",
      z = { ":TZAtaraxis<CR>", "Zoom ataraxis"},
      m = { ":TZMinimalist<CR>", "Zoom minimalist"},
      f = { ":TZFocus<CR>", "Zoom Focus"},
  },
  o = {
      name = "open",
      -- nvimtree
      p = { ":NvimTreeToggle<CR>", "Project sidebar"},
      t = { ":Vista!!<CR>", "Tags sidebar"},
  },
  w = {
      name = "workspace",
      a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add folder"},
      r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove folder"},
      l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List folder"},
  },
  m = {
      name = "localleader",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
      e = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Errors"},
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"},
  }
}, { prefix = "<leader>" })
wk.register({
    ["g"] = {
        name = "goto",
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition"},
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
        i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation"},
        r = { "<Cmd>lua vim.lsp.buf.references()<CR>", "References"},
  }
})
