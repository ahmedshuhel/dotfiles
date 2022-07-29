local packer = require("packer")

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")

    -- use({
    --   "navarasu/onedark.nvim",
    --   config = function()
    --     require("plugins.maq-onedark").config()
    --   end,
    -- })

    use({
      "EdenEast/nightfox.nvim",
      config = function()
        require("nightfox").setup({
          options = {
            styles = {
              comments = "italic",
              keywords = "bold",
              types = "italic,bold",
            }
          }
        })
        vim.cmd("colorscheme dayfox")
      end
    })

    use({
      "f-person/auto-dark-mode.nvim",
      config = function()
        local adm = require("auto-dark-mode")
        adm.setup({
          update_interval = 1000,
          set_dark_mode = function()
                  vim.api.nvim_set_option('background', 'dark')
                  vim.cmd('colorscheme nightfox')
          end,
          set_light_mode = function()
                  vim.api.nvim_set_option('background', 'light')
                  vim.cmd('colorscheme dayfox')
          end,
        })
        adm.init()
      end
    })

    use({
      "folke/which-key.nvim",
      config = function()
        require("plugins.wk").config()
      end,
    })

    use({
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      config = function()
        require("plugins.maq-bqf").config()
      end,
    })

    use("ojroques/nvim-bufdel")

    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.file-icons")
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      after = { "nvim-web-devicons", "which-key.nvim" },
      config = function()
        require("plugins.tree-nvim").config()
      end,
    })

    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("plugins.maq-toggleterm").config()
      end,
    })

    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      after = { "nvim-tree.lua", "toggleterm.nvim", "nvim-dap-ui" },
      config = function()
        require('lualine').setup({
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
          },
          extensions = {
            'quickfix',
            'nvim-tree',
            'toggleterm',
            'nvim-dap-ui',
            'fugitive',
            'man'
          }
        })
      end
    })

    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("colorizer").setup()
        vim.cmd("ColorizerReloadAllBuffers")
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
        require("plugins.treesitter-nvim").config()
      end,
    })

    use({
      "nvim-treesitter/playground",
      after = "nvim-treesitter",
      cmd = "TSPlaygroundToggle",
      config = function()
        require("plugins.treesitter-playground").config()
      end,
    })

    use({
      "NTBBloodbath/rest.nvim",
      after = { "nvim-treesitter" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugins.maq-rest-nvim").config()
      end,
    })

    use({
      "williamboman/nvim-lsp-installer",
      requires = {
        {
          "neovim/nvim-lspconfig",
          requires = {
            {
              "jose-elias-alvarez/null-ls.nvim",
              requires = {
                "nvim-lua/plenary.nvim",
              },
            },
          },
        },
      },
      config = function()
        require("plugins.maq-lspconfig").config()
      end,
    })

    use({
      "ray-x/lsp_signature.nvim",
      after = { "nvim-lspconfig" },
      config = function()
        require("plugins.lsp-signature").config()
      end,
    })

    use({
      "onsails/lspkind-nvim",
      event = "BufRead",
      config = function()
        require("lspkind").init()
      end,
    })

    use({
      "kristijanhusak/vim-dadbod-ui",
      config = function()
        require("plugins.dadbod-ui").config()
      end,
      requires = {
        "tpope/vim-dadbod",
      },
    })

    use({
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require("plugins.cmp-completion").config()
      end,
      requires = {
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        { "kristijanhusak/vim-dadbod-completion", after = { "nvim-cmp", "vim-dadbod-ui" } },
        {
          "windwp/nvim-autopairs",
          after = "nvim-cmp",
          config = function()
            require("nvim-autopairs").setup()
          end,
        },
        {
          "L3MON4D3/LuaSnip",
          requires = "rafamadriz/friendly-snippets",
          config = function()
            require("plugins.ls").config()
          end,
        },
      },
    })

    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.maq-trouble").config()
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-media-files.nvim" },
        {
          "ahmedkhalf/project.nvim",
          config = function()
            require("project_nvim").setup({
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            })
          end,
        },
      },
      config = function()
        require("plugins.telescope-nvim").config()
      end,
    })

    use({
      "tpope/vim-fugitive",
      requires = {
        "tpope/vim-dispatch",
        "tpope/vim-rhubarb",
      },
      config = function()
        require("plugins.fugitive").config()
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      event = "BufRead",
      config = function()
        require("plugins.gitsigns-nvim").config()
      end,
    })

    use({
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        require("plugins.matchup").config()
      end,
    })

    use({
      "terrortylor/nvim-comment",
      config = function()
        require("plugins.comment").config()
      end,
    })

    use({
      "tweekmonster/startuptime.vim",
      cmd = "StartupTime",
    })

    use({
      "Pocco81/TrueZen.nvim",
      config = function()
        require("plugins.zenmode").config()
      end,
    })

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        require("plugins.blankline").config()
      end,
    })

    use({
      "dhruvasagar/vim-table-mode",
      config = function()
        require("plugins.tablemode").config()
      end,
    })

    use({
      "plasticboy/vim-markdown",
      requires = {
        "godlygeek/tabular",
      },
      config = function()
        require("plugins.vim-markdown").config()
      end,
    })

    -- use({
    --   "Pocco81/dap-buddy.nvim",
    --   config = function()
    --     require("plugins.dapinstall").config()
    --   end,
    -- })

    use({
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("plugins.dap").config()
      end,
    })

    -- use("~/Workspace/devlife.vim")

    use("ahmedshuhel/devlife.vim")

    use({
      "christoomey/vim-tmux-navigator",
      config = function()
        require("plugins.tmux-navigator").config()
      end,
    })

    use({
      "rafcamlet/nvim-luapad",
      config = function()
        require("plugins.maq-luapad").config()
      end,
    })

    -- Show markers
    use("kshenoy/vim-signature")

    use("tpope/vim-surround")

    use("tpope/vim-eunuch")

    use("tpope/vim-repeat")

    use({
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end,
    })
  end,
  config = {
    auto_clean = true,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
