local install_path = ("%s/site/pack/packer-lib/opt/packer.nvim"):format(vim.fn.stdpath "data")

local function install_packer()
    vim.fn.termopen(("git clone https://github.com/wbthomason/packer.nvim %q"):format(install_path))
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    install_packer()
end

vim.cmd.packadd { "packer.nvim" }

function _G.packer_upgrade()
    vim.fn.delete(install_path, "rf")
    install_packer()
end

vim.cmd.command { "PackerUpgrade", ":call v:lua.packer_upgrade()", bang = true }

local function spec(use)
    use { "lewis6991/impatient.nvim" }

    -- tpope
    use {
        "tpope/vim-repeat",
        "tpope/vim-surround",
        "tpope/vim-fugitive",
        "tpope/vim-unimpaired",
        {
            "tpope/vim-sleuth",
            setup = function()
                vim.g.sleuth_automatic = 0
            end,
        },
        {
            "tpope/vim-dispatch",
            requires = { "radenling/vim-dispatch-neovim" },
        },
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
    }

    use { "christoomey/vim-tmux-navigator" }
    -- test & debugging
    use {
        {
            "nvim-neotest/neotest",
            requires = {
                "haydenmeade/neotest-jest",
                "rouge8/neotest-rust",
                "nvim-neotest/neotest-plenary",
                "nvim-neotest/neotest-python",
            },
        },
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        { "williamboman/nvim-dap-vscode-js", branch = "feat/debug-cmd" },
        "jbyuki/one-small-step-for-vimkind",
    }

    -- things that either enhance builtin behaviours or could easily be candidates for default behaviour
    use {
        "airblade/vim-rooter",
        "akinsho/toggleterm.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "ggandor/leap.nvim",
        "levouh/tint.nvim",
        "lewis6991/hover.nvim",
        "lewis6991/satellite.nvim",
        "linty-org/readline.nvim",
        "luukvbaal/stabilize.nvim",
        "monaqa/dial.nvim",
        "numToStr/Comment.nvim",
        "nvim-lualine/lualine.nvim",
        "simnalamburt/vim-mundo",
        "stevearc/aerial.nvim",
        "stevearc/dressing.nvim",
        "szw/vim-maximizer",
        "windwp/nvim-autopairs",
        "zbirenbaum/neodim",
        "s1n7ax/nvim-window-picker",
        { "williamboman/notifier.nvim", branch = "feat/left-aligned-content" },
        { "kevinhwang91/nvim-bqf", ft = "qf", requires = {
            "junegunn/fzf",
        } },
        { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", as = "lsp_lines.nvim" },
        {
            "andymass/vim-matchup",
            setup = function()
                vim.g.matchup_matchparen_offscreen = {
                    method = "popup",
                    fullwidth = 1,
                    highlight = "OffscreenMatchPopup",
                }
            end,
        },
        {
            -- "hrsh7th/nvim-cmp",
            "williamboman/nvim-cmp",
            branch = "feat/docs-preview-window",
            requires = {
                "andersevenrud/cmp-tmux",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "lukas-reineke/cmp-rg",
                "onsails/lspkind-nvim",
                "petertriho/cmp-git",
                "rcarriga/cmp-dap",
                "saadparwaiz1/cmp_luasnip",
                {
                    "L3MON4D3/LuaSnip",
                    requires = { "rafamadriz/friendly-snippets" },
                },
            },
        },
        {
            "junegunn/vim-peekaboo",
            setup = function()
                vim.g.peekaboo_compact = 0
            end,
        },
        {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
        },
        {
            "editorconfig/editorconfig-vim",
            setup = function()
                vim.g.EditorConfig_max_line_indicator = ""
                vim.g.EditorConfig_preserve_formatoptions = 1
            end,
        },
    }

    -- UI
    use {
        "projekt0n/github-nvim-theme",
        "navarasu/onedark.nvim",
        "kyazdani42/nvim-web-devicons",
        "lukas-reineke/headlines.nvim",
        "lukas-reineke/indent-blankline.nvim",
        "NvChad/nvim-colorizer.lua",
    }

    -- Treesitter
    if vim.fn.has "unix" == 1 then
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects",
                "p00f/nvim-ts-rainbow",
                "JoosepAlviste/nvim-ts-context-commentstring",
                "windwp/nvim-ts-autotag",
            },
        }
    end

    -- Mason
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    -- LSP
    use {
        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup {}
            end,
        },
        "neovim/nvim-lspconfig",
        "b0o/SchemaStore.nvim",
        "ray-x/lsp_signature.nvim",
        { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/typescript.nvim",
        { "lvimuser/lsp-inlayhints.nvim", branch = "anticonceal" },
        "SmiteshP/nvim-navic",
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-project.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
    }

    -- git
    use {
        "rhysd/git-messenger.vim",
        "rhysd/committia.vim",
        "ruifm/gitlinker.nvim",
        "lewis6991/gitsigns.nvim",
    }

    -- Misc
    use { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } }
    use "wakatime/vim-wakatime"
    use "ahmedshuhel/devlife.vim"
end

require("packer").startup {
    spec,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
        max_jobs = 10,
    },
}
