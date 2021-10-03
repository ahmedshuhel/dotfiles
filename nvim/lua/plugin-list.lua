local packer = require("packer")
local use = packer.use

return packer.startup({
  function()
    use("wbthomason/packer.nvim")

    use({
      "navarasu/onedark.nvim",
      after = "packer.nvim",
      config = function()
        require("plugins.onedark").config()
      end,
    })

    use({
      "ojroques/nvim-bufdel",
      config = function()
        require("plugins.bufdel").config()
      end,
    })

    use({
      "kyazdani42/nvim-web-devicons",
      after = "onedark.nvim",
      config = function()
        require("plugins.file-icons")
      end,
    })

    use({
      "ahmedshuhel/nvim-tree.lua",
      branch = "bufdel",
      after = { "onedark.nvim", "nvim-bufdel", "nvim-web-devicons" },
      config = function()
        require("plugins.tree-nvim").config()
      end,
    })

    use({
      "akinsho/nvim-bufferline.lua",
      after = { "onedark.nvim", "nvim-bufdel" },
      config = function()
        require("plugins.bufferline").config()
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
      "kabouzeid/nvim-lspinstall",
      after = "trouble.nvim",
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspinstall",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    use({
      "neovim/nvim-lspconfig",
      event = "BufRead",
      after = { "onedark.nvim", "null-ls.nvim" },
      config = function()
        require("plugins.null-ls").config()
        require("plugins.nvim-lspconfig").config()
      end,
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
      "hrsh7th/nvim-cmp",
      after = "onedark.nvim",
      event = "InsertEnter",
      config = function()
        require("plugins.cmp-completion").config()
      end,
    })

    use({
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
        require("plugins.luasnip").config()
      end,
    })

    use({
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
    })

    use({
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
    })

    use({
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
    })

    use({
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
    })

    use({
      "rafamadriz/friendly-snippets",
      after = "cmp-buffer",
    })

    use({
      "hrsh7th/cmp-path",
      after = "cmp-nvim-lsp",
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
      "kristijanhusak/vim-dadbod-completion",
      after = { "nvim-cmp", "vim-dadbod-ui" },
    })

    use({
      "nvim-telescope/telescope.nvim",
      after = "onedark.nvim",
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
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("nvim-autopairs").setup()
        require("nvim-autopairs.completion.cmp").setup({
          map_cr = true, --  map <CR> on insert mode
          map_complete = true, -- it will auto insert `(` after select function or method item
          auto_select = true, -- automatically select the first item
        })
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

    use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

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
      "ahmedshuhel/trouble.nvim",
      branch = "rightbelow",
      after = "onedark.nvim",
      before = "telescope.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins.trouble").config()
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

    -- Show markers
    use("kshenoy/vim-signature")

    use("tpope/vim-surround")

    use("tpope/vim-eunuch")
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
