local packer = require("packer")

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")

    use({
      "folke/which-key.nvim",
      config = function()
        require("plugins.wk").config()
      end,
    })

    use({
      "navarasu/onedark.nvim",
      after = "packer.nvim",
      config = function()
        require("plugins.onedark").config()
      end,
    })

    use({
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      after = "onedark.nvim",
      config = function()
        require("plugins.bqf").config()
      end,
    })

    use("ojroques/nvim-bufdel")

    use({
      "kyazdani42/nvim-web-devicons",
      after = "onedark.nvim",
      config = function()
        require("plugins.file-icons")
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      after = { "onedark.nvim", "nvim-web-devicons" },
      config = function()
        require("plugins.tree-nvim").config()
      end,
    })

    use({
      "akinsho/nvim-bufferline.lua",
      after = { "onedark.nvim", "nvim-bufdel" },
      config = function()
        require("plugins.bufline").config()
      end,
    })

    use({
      "ahmedshuhel/toggleterm.nvim",
      after = "onedark.nvim",
      branch = "new_rightbelow",
      config = function()
        require("plugins.toggleterm").config()
      end,
    })

    use({
      "glepnir/galaxyline.nvim",
      after = { "onedark.nvim", "toggleterm.nvim" },
      config = function()
        require("plugins.statusline").config()
      end,
    })

    use({
      "norcalli/nvim-colorizer.lua",
      after = "onedark.nvim",
      event = "BufRead",
      config = function()
        require("colorizer").setup()
        vim.cmd("ColorizerReloadAllBuffers")
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      after = "onedark.nvim",
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
      after = { "nvim-treesitter", "onedark.nvim" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugins.rest-nvim").config()
      end,
    })

    use({
      "williamboman/nvim-lsp-installer",
      after = { "nvim-lspconfig" },
      config = function()
        require("plugins.lspconfig").config()
      end,
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    use({
      "ray-x/lsp_signature.nvim",
      after = { "onedark.nvim", "nvim-lspconfig" },
      config = function()
        require("plugins.lsp-signature").config()
      end,
    })

    use({
      "onsails/lspkind-nvim",
      after = "onedark.nvim",
      event = "BufRead",
      config = function()
        require("lspkind").init()
      end,
    })

    use({
      "kristijanhusak/vim-dadbod-ui",
      after = "onedark.nvim",
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
      "neovim/nvim-lspconfig",
      event = "BufRead",
      after = { "onedark.nvim", "null-ls.nvim", "nvim-cmp" },
      config = function()
        require("plugins.null-ls").config()
      end,
    })

    use({
      "ahmedshuhel/trouble.nvim",
      branch = "rightbelow",
      after = { "onedark.nvim" },
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.trouble").config()
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      after = { "onedark.nvim", "trouble.nvim" },
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-media-files.nvim" },
      },
      config = function()
        require("plugins.telescope-nvim").config()
      end,
    })

    use({
      "tpope/vim-fugitive",
      after = "onedark.nvim",
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
      after = "onedark.nvim",
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
      after = "onedark.nvim",
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
      after = "onedark.nvim",
      config = function()
        require("plugins.zenmode").config()
      end,
    })

    use({
      "lukas-reineke/indent-blankline.nvim",
      after = "onedark.nvim",
      event = "BufRead",
      setup = function()
        require("plugins.blankline").config()
      end,
    })

    use({
      "dhruvasagar/vim-table-mode",
      after = "onedark.nvim",
      config = function()
        require("plugins.tablemode").config()
      end,
    })

    use({
      "plasticboy/vim-markdown",
      after = "onedark.nvim",
      requires = {
        "godlygeek/tabular",
      },
      config = function()
        require("plugins.vim-markdown").config()
      end,
    })

    use({
      "Pocco81/DAPInstall.nvim",
      config = function()
        require("plugins.dapinstall").config()
      end,
    })

    use({
      "rcarriga/nvim-dap-ui",
      after = { "onedark.nvim", "DAPInstall.nvim" },
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("plugins.dap").config()
      end,
    })
    use("ahmedshuhel/devlife.vim")

    use({
      "christoomey/vim-tmux-navigator",
      config = function()
        require("plugins.tmux-navigator").config()
      end,
    })

    use({
      "rafcamlet/nvim-luapad",
      after = "onedark.nvim",
      config = function()
        require("plugins.luapad").config()
      end,
    })

    -- Show markers
    use("kshenoy/vim-signature")

    use("tpope/vim-surround")

    use("tpope/vim-eunuch")

    use("tpope/vim-repeat")
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
