local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = {
            "bash",
            "c",
            "cmake",
            "comment",
            "commonlisp",
            "cpp",
            "css",
            "dockerfile",
            "go",
            "gomod",
            "html",
            "javascript",
            "json",
            "lua",
            "python",
            "regex",
            "rust",
            "toml",
            "yaml",
        },
        highlight = {
            enable = true,
            use_languagetree = true
        }
    }
end

return M
