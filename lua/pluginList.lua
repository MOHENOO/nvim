local packer = require("packer")
local use = packer.use

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    },
    git = {
        clone_timeout = 600 -- Timeout, in seconds, for git clones
    }
}

-- auto source pluginList
vim.cmd([[autocmd BufWritePost pluginList.lua source <afile> | PackerCompile]])
vim.cmd('let g:rainbow_active = 1')
vim.cmd('let g:vista_default_executive = "ctags"')
vim.cmd('let g:vista_executive_for = {"go":"nvim_lsp","python":"nvim_lsp"}')

return packer.startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Buffer line
        use "akinsho/nvim-bufferline.lua"

        -- Status line
        use {
            "glepnir/galaxyline.nvim",
            config = function()
                require("plugins.statusline").config()
            end
        }

        -- Theme
        use 'joshdick/onedark.vim'
        use 'arcticicestudio/nord-vim'

        -- Color highlighter
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("colorizer").setup()
                vim.cmd("ColorizerReloadAllBuffers")
            end
        }

        -- language related plugins
        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require("plugins.treesitter").config()
            end
        }

        use 'ludovicchabant/vim-gutentags' -- Automatic tags management

        use {
            "kabouzeid/nvim-lspinstall",
        }

        use {
            "neovim/nvim-lspconfig",
            event = "BufRead",
            config = function()
                require("plugins.lspconfig").config()
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("lspkind").init()
            end
        }

        -- load compe in insert mode only
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("plugins.compe").config()
            end,
            wants = {"LuaSnip"},
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require("plugins.compe").snippets()
                    end
                },
                "rafamadriz/friendly-snippets",
                "andersevenrud/compe-tmux"
            }
        }

        use {"sbdchd/neoformat", cmd = "Neoformat"}

        -- file managing , picker etc
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require("plugins.nvimtree").config()
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.icons").config()
            end
        }

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
                {"nvim-telescope/telescope-media-files.nvim"}
            },
            cmd = "Telescope",
            config = function()
                require("plugins.telescope").config()
            end
        }

        -- git stuff
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("plugins.gitsigns").config()
            end
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function()
                require("nvim-autopairs").setup()
                require("nvim-autopairs.completion.compe").setup(
                    {
                        map_cr = true,
                        map_complete = true -- insert () func completion
                    }
                )
            end
        }

        use {"andymass/vim-matchup", event = "CursorMoved"}

        -- use {
        --     "terrortylor/nvim-comment",
        --     cmd = "CommentToggle",
        --     config = function()
        --         require("nvim_comment").setup()
        --     end
        -- }
        use 'tpope/vim-commentary'
        use 'junegunn/vim-easy-align'
        use 'tpope/vim-surround'
        use {
            'easymotion/vim-easymotion', 
            cond = function()
                return vim.api.nvim_eval('!exists("g:vscode")')==1
            end,
        }
        use {
            'asvetliakov/vim-easymotion',
            cond = function()
                return vim.api.nvim_eval('exists("g:vscode")')==1
            end,
            as = "vsc-easymotion"
        }
        use 'mbbill/undotree'
        use 'mg979/vim-visual-multi'

        use {
            "glepnir/dashboard-nvim",
            -- cmd = {
            --     "Dashboard",
            --     "DashboardNewFile",
            --     "DashboardJumpMarks",
            --     "SessionLoad",
            --     "SessionSave"
            -- },
            setup = function()
                require("plugins.dashboard").config()
            end
        }

        use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

        -- load autosave only if its globally enabled
        use {
            "Pocco81/AutoSave.nvim",
            config = function()
                require("plugins.zenmode").autoSave()
            end,
            cond = function()
                return vim.g.auto_save == true
            end,
        }

        -- smooth scroll
        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("neoscroll").setup()
            end
        }

        use {
            "Pocco81/TrueZen.nvim",
            cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
            config = function()
                require("plugins.zenmode").config()
            end
        }

        --   use "alvan/vim-closetag" -- for html autoclosing tag

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("utils").blankline()
            end
        }

        use 'luochen1990/rainbow'

        use {
          'iamcco/markdown-preview.nvim',
          run = 'cd app && yarn install',
          cmd = 'MarkdownPreview'
        }

        -- Tmux
        use 'christoomey/vim-tmux-navigator'
        use 'tmux-plugins/vim-tmux-focus-events'
        -- use 'fatih/vim-go'
        use 'liuchengxu/vista.vim'

        use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
        }
    end
)
