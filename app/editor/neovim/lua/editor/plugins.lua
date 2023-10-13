require("lazy").setup {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "carbonfox"
		end,
	},

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			vim.notify = require "notify"
		end,
	},

	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		event = "InsertEnter",
		config = function()
			vim.api.nvim_create_autocmd("InsertEnter", {
				group = vim.api.nvim_create_augroup("CodeiumAuGroup", { clear = true }),
				pattern = "*",
				callback = function()
					local config = require "completion.config"
					require("cmp").setup.buffer {
						sources = vim.tbl_extend(
							"keep",
							config.sources.completion,
							{ { name = "codeium" } }
						),
					}
				end,
			})

			require("codeium").setup {}
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"haskell",
					"go",
					"c",
					"cpp",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"zig",
					"markdown",
					"markdown_inline",
					"regex",
					"bash",
					"python",
					"c_sharp",
					"html",
					"javascript",
					"typescript",
					"tsx",
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<Space>" },
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		config = function()
			require "editor.maps"
		end,
	},

	-- {
	--         "folke/noice.nvim",
	--         event = "BufEnter",
	--         opts = {
	--                 lsp = {
	--                         override = {
	--                                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--                                 ["vim.lsp.util.stylize_markdown"] = true,
	--                                 ["cmp.entry.get_documentation"] = false,
	--                         },
	--                 },
	--
	--                 cmdline = {
	--                         enabled = false,
	--                 },
	--
	--                 messages = {
	--                         enabled = false,
	--                 },
	--         },
	--         dependencies = {
	--                 "MunifTanjim/nui.nvim",
	--                 "rcarriga/nvim-notify",
	--         },
	-- },
	--

	{
		"neovim/nvim-lspconfig",
		dependencies = {},

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
		event = "BufEnter",
		module = "cmp",
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
		dependencies = {
			"nvim-lua/plenary.nvim",
			"gbrlsnchs/telescope-lsp-handlers.nvim",
			"ThePrimeagen/harpoon",
		},
		lazy = true,
		cmd = "Telescope",
		config = function()
			local telescope = require "telescope"
			telescope.load_extension "lsp_handlers"
			telescope.load_extension "harpoon"

			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"build",
						"dist",
						"yarn.lock",
						"~",
						".cache/",
					},
				},
			}
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			enable_abbr = true,
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		main = "ibl",
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

		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"nvimdev/guard-collection",
		},

		lazy = false,
		config = function()
			local ft = require "guard.filetype"
			ft("lua"):fmt("lsp"):fmt "stylua"
			ft("zig"):fmt {
				cmd = "zig",
				args = { "fmt", "--stdin" },
				stdin = true,
			}

			ft("c,cpp"):fmt("clang-format"):fmt "lsp"
			ft("python"):fmt "black"

			require("guard").setup {
				fmt_on_save = true,
				lsp_as_default_formatter = true,
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
					"black",
					"zls",
					"prettier",
				},
			}

			require("mason-lspconfig").setup {
				ensure_installed = {
					"grammarly",
					"bashls",
					"lua_ls",
					"gopls",
					"zls",
					"lemminx",
					"bashls",
					"pkgbuild_language_server",
					"pyright",
					"csharp_ls",
					"html",
					"emmet_ls",
					"cssls",
					"tailwindcss",
					"tsserver",
				},
			}
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},

		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_c = {
					"require('lsp-progress').progress()",
				},
			},
		},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		module = "lsp-progress",
		config = function()
			require("lsp-progress").setup()
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		opts = {},
		cmd = "Lspsaga",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"numToStr/Comment.nvim",
		keys = { "<Space>" },
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
		event = "BufEnter",
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "norg",
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = { config = { engine = "nvim-cmp" } }, -- completions hah!
					["core.export.markdown"] = {}, -- Mark the fall
					["core.export"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Documents/Neorg",
							},
						},
					},
				},
			}
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
