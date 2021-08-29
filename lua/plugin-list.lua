local packer = require("packer")
local use = packer.use

return packer.startup({function()
        use "wbthomason/packer.nvim"
        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function()
              require "plugins.nvim-base16"
            end
        }

        -- config in init.lua "file-icons"
        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
              require "plugins.file-icons"
            end
        }


        use {
            "akinsho/nvim-bufferline.lua",
            after = "nvim-base16.lua",
            config = function()
              require "plugins.bufferline"
            end
        }
        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
              require "plugins.statusline"
            end
        }

        use {"akinsho/nvim-toggleterm.lua"}
        -- tmux navigation
        use "christoomey/vim-tmux-navigator"

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
                require("plugins.treesitter-nvim").config()
            end
        }

        use "kabouzeid/nvim-lspinstall"

        use {
            "neovim/nvim-lspconfig",
            event = "BufRead",
            after = "nvim-lspinstall",
            config = function()
                require("plugins.nvim-lspconfig").config()
            end
        }

        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
               require("plugins.lsp-signature").config()
            end,
        }


        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("lspkind").init()
            end
        }

        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            config = function()
                require('plugins.cmp-completion').config()
            end,
        }

        use {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            after = "nvim-cmp",
            config = function()
                require('plugins.luasnip').config()
            end,
        }

        use {
            "saadparwaiz1/cmp_luasnip",
            after = "LuaSnip",
        }

        use {
            "hrsh7th/cmp-nvim-lua",
            after = "cmp_luasnip",
        }

        use {
            "hrsh7th/cmp-nvim-lsp",
            after = "cmp-nvim-lua",
        }

        use {
            "hrsh7th/cmp-buffer",
            after = "cmp-nvim-lsp",
        }

        use {
            "rafamadriz/friendly-snippets",
            after = "cmp-buffer",
        }

        use {
            "kristijanhusak/vim-dadbod-ui",
            config = function()
              require('plugins.dadbod-ui').config()
            end,
            requires = {
                'tpope/vim-dadbod',
            }
        }

 	use {
	    "kristijanhusak/vim-dadbod-completion",
	    after = {"nvim-cmp", "vim-dadbod-ui"}
	}

        use {
            "mhartington/formatter.nvim",
            cmd = "Format",
            config = function()
                require("plugins.formatter").config()
            end
        }

        -- file managing , picker etc
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {
              "NvimTreeOpen",
              "NvimTreeToggle",
              "NvimTreeFindFile"
            },
            config = function()
                require("plugins.tree-nvim").config()
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
                require("plugins.telescope-nvim").config()
            end
        }

        -- git stuff
        use {
            "tpope/vim-fugitive",
            requires = {
                'tpope/vim-dispatch',
                'tpope/vim-rhubarb'
            }
        }
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                'nvim-lua/plenary.nvim'
            },
            event = "BufRead",
            config = function()
                require("plugins.gitsigns-nvim").config()
            end
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
	    after = "nvim-cmp",
            config = function()
                require("nvim-autopairs").setup()
                require("nvim-autopairs.completion.cmp").setup({
                  map_cr = true, --  map <CR> on insert mode
                  map_complete = true, -- it will auto insert `(` after select function or method item
                  auto_select = true -- automatically select the first item
                })
            end
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved",
            config = function()
                require("plugins.matchup").config()
            end
        }

        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("nvim_comment").setup()
            end
        }

        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Dashboard",
                "DashboardNewFile",
                "DashboardJumpMarks",
                "SessionLoad",
                "SessionSave"
            },
            setup = function()
                require("plugins.dashboard").config()
            end
        }

        use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

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

        use {
            "dhruvasagar/vim-table-mode",
            config = function()
                require("plugins.tablemode").config()
            end
        }

        use {
            "plasticboy/vim-markdown",
            requires = {
                'godlygeek/tabular',
            }
        }
        -- Lua
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
              require("trouble").setup ({
                position = "bottom", -- position of the list can be: bottom, top, left, right
                height = 10, -- height of the trouble list when position is top or bottom
                icons = true, -- use devicons for filenames
              })
            end
        }

        -- delete buffer without messing up your entire window layout
        use 'ojroques/nvim-bufdel'

        use "ahmedshuhel/devlife.vim"

    end,
    config = {
      auto_clean = true,
      display = {
        open_fn = function()
          return require('packer.util').float({ border = 'single' })
        end
      }
 }})
