require("lazy").setup {
        {
                "EdenEast/nightfox.nvim",
                priority = 1000,
                config = function()
                        vim.cmd "colorscheme carbonfox"
                end,
        },

        {
                "rcarriga/nvim-notify",
                config = function()
                        vim.notify = require "notify"
                end,
        },

        {
                'nvim-treesitter/nvim-treesitter',
                event = 'BufEnter',
                config = function()
                        require 'nvim-treesitter.configs'.setup {
                                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig" },

                                highlight = {
                                        enable = true,
                                        additional_vim_regex_highlighting = false,
                                }
                        }
                end
        },

        {
                "folke/which-key.nvim",
                event = "VeryLazy",
                init = function()
                        vim.o.timeout = true
                        vim.o.timeoutlen = 300
                end,

                config = function()
                        require "editor.maps"
                end,
        },

        {
                "folke/noice.nvim",
                event = "VeryLazy",
                opts = {},
                dependencies = {
                        "MunifTanjim/nui.nvim",
                        "rcarriga/nvim-notify",
                },
        },

        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        "lukas-reineke/lsp-format.nvim",
                },

                config = function()
                        require "lsp"
                end,
        },
        {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                lazy = true,
                version = "2.*",
                build = "make install_jsregexp",
                config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                end,
        },

        {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
                dependencies = {
                        "hrsh7th/cmp-nvim-lsp",
                        "saadparwaiz1/cmp_luasnip",
                        "hrsh7th/cmp-cmdline",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-buffer",
                        "L3MON4D3/LuaSnip",
                        "saadparwaiz1/cmp_luasnip",
                },

                config = function()
                        require "completion"
                end,
        },

        {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.2",
                dependencies = { "nvim-lua/plenary.nvim", "gbrlsnchs/telescope-lsp-handlers.nvim" },
                lazy = true,
                cmd = "Telescope",
                config = function()
                        local telescope = require "telescope"
                        telescope.load_extension "lsp_handlers"
                end,
        },

        {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                opts = {}, -- this is equalent to setup({}) function
        },

        {
                "lukas-reineke/indent-blankline.nvim",
                event = "BufEnter",
                opts = {},
        },

        {
                "nvim-neo-tree/neo-tree.nvim",
                cmd = "Neotree",
                branch = "v3.x",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "nvim-tree/nvim-web-devicons",
                        "MunifTanjim/nui.nvim",
                },

                opts = {
                        enable_git_status = true,
                        enable_diagnostics = true,
                        close_if_last_window = false,
                },
        },

        {
                "nvimdev/guard.nvim",
                event = "VeryLazy",
                config = function()
                        local ft = require "guard.filetype"
                        ft("lua"):fmt "stylua"

                        require("guard").setup {
                                fmt_on_save = true,
                                lsp_as_default_formatter = false,
                        }
                end,
        },

        {
                "williamboman/mason.nvim",
                dependencies = {
                        "williamboman/mason-lspconfig.nvim",
                        "WhoIsSethDaniel/mason-tool-installer.nvim",
                },
                config = function()
                        require("mason").setup()

                        require("mason-tool-installer").setup {
                                ensure_installed = {
                                        "stylua",
                                },
                        }
                        require("mason-lspconfig").setup {
                                ensure_installed = {
                                        "lua_ls",
                                        "zls",
                                },
                        }
                end,
        },
}
