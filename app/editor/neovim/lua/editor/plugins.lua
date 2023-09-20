require("lazy").setup {
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.nord_italic = false
	-- 		vim.g.nord_bold = false
	-- 		vim.cmd "colorscheme nord"
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin"
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require "notify"
		end,
	},

	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<C-k>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
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
		event = "VeryLazy",
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
		opts = {
			check_ts = true,
			enable_abbr = true,
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
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
		config = function()
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
				group = "lualine_augroup",
				callback = require("lualine").refresh,
			})
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
		event = "BufEnter",
		opts = {},
	},

	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = { config = { engine = "nvim-cmp" } }, -- completions hah!
					["core.export.markdown"] = {}, -- Mark the fall
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
}
