local packer = require("packer")
local use = packer.use

local plugins = {
  "wbthomason/packer.nvim",
  {
    "navarasu/onedark.nvim",
    after = "packer.nvim",
    config = function()
      require("plugins.onedark").config()
    end,
  },
  "ojroques/nvim-bufdel",
  {
    "kyazdani42/nvim-web-devicons",
    after = "onedark.nvim",
    config = function()
      require("plugins.file-icons")
    end,
  },
  {
    "ahmedshuhel/nvim-tree.lua",
    branch = "bufdel",
    after = { "onedark.nvim", "nvim-bufdel", "nvim-web-devicons" },
    config = function()
      require("plugins.tree-nvim").config()
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    after = { "onedark.nvim", "nvim-bufdel" },
    config = function()
      require("plugins.bufferline").config()
    end,
  },
  {
    "ahmedshuhel/toggleterm.nvim",
    after = "onedark.nvim",
    branch = "new_rightbelow",
    config = function()
      require("plugins.toggleterm").config()
    end,
  },
  {
    "glepnir/galaxyline.nvim",
    after = { "onedark.nvim", "toggleterm.nvim" },
    config = function()
      require("plugins.statusline").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    after = "onedark.nvim",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
      vim.cmd("ColorizerReloadAllBuffers")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    after = "onedark.nvim",
    event = "BufRead",
    config = function()
      require("plugins.treesitter-nvim").config()
    end,
  },
  {
    "nvim-treesitter/playground",
    after = "nvim-treesitter",
    config = function()
      require("plugins.treesitter-playground").config()
    end,
  },
  {
    "NTBBloodbath/rest.nvim",
    after = { "nvim-treesitter", "onedark.nvim" },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.rest-nvim").config()
    end,
  },
  {
    "kabouzeid/nvim-lspinstall",
    after = "trouble.nvim",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspinstall",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    after = { "onedark.nvim", "null-ls.nvim" },
    config = function()
      require("plugins.null-ls").config()
      require("plugins.nvim-lspconfig").config()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    after = { "onedark.nvim", "nvim-lspconfig" },
    config = function()
      require("plugins.lsp-signature").config()
    end,
  },
  {
    "onsails/lspkind-nvim",
    after = "onedark.nvim",
    event = "BufRead",
    config = function()
      require("lspkind").init()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    after = "onedark.nvim",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp-completion").config()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.luasnip").config()
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua",
  },
  {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp",
  },
  {
    "rafamadriz/friendly-snippets",
    after = "cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
    after = "cmp-nvim-lsp",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    after = "onedark.nvim",
    config = function()
      require("plugins.dadbod-ui").config()
    end,
    requires = {
      "tpope/vim-dadbod",
    },
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    after = { "nvim-cmp", "vim-dadbod-ui" },
  },
  {
    "ahmedshuhel/trouble.nvim",
    branch = "rightbelow",
    after = { "onedark.nvim" },
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.trouble").config()
    end,
  },
  {
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
  },
  {
    "tpope/vim-fugitive",
    after = "onedark.nvim",
    requires = {
      "tpope/vim-dispatch",
      "tpope/vim-rhubarb",
    },
    config = function()
      require("plugins.fugitive").config()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    after = "onedark.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufRead",
    config = function()
      require("plugins.gitsigns-nvim").config()
    end,
  },
  {
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
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require("plugins.matchup").config()
    end,
  },
  {
    "terrortylor/nvim-comment",
    after = "onedark.nvim",
    config = function()
      require("plugins.comment").config()
    end,
  },
  {
    "tweekmonster/startuptime.vim",
    cmd = "StartupTime",
  },
  {
    "Pocco81/TrueZen.nvim",
    after = "onedark.nvim",
    config = function()
      require("plugins.zenmode").config()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    after = "onedark.nvim",
    event = "BufRead",
    setup = function()
      require("plugins.blankline").config()
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    after = "onedark.nvim",
    config = function()
      require("plugins.tablemode").config()
    end,
  },
  {
    "plasticboy/vim-markdown",
    after = "onedark.nvim",
    requires = {
      "godlygeek/tabular",
    },
    config = function()
      require("plugins.vim-markdown").config()
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    config = function()
      require("plugins.dapinstall").config()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    after = { "onedark.nvim", "DAPInstall.nvim" },
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("plugins.dap").config()
    end,
  },
  "ahmedshuhel/devlife.vim",
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      require("plugins.tmux-navigator").config()
    end,
  },
  -- Show markers
  "kshenoy/vim-signature",
  "tpope/vim-surround",
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  -- Add nslp
  -- Add which key
}

local function load()
  return packer.startup({
    function()
      for _, plugin in ipairs(plugins) do
        use(plugin)
      end
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
end

return {
  load = load,
  plugins = plugins
}
