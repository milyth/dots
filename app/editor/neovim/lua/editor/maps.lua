local K = require "which-key"
local harpoonMark = require "harpoon.mark"

local opts = {
	silent = true,
	noremap = true,
}

vim.keymap.set({ "n" }, "<ESCAPE>", "<cmd>nohl<cr>", opts)
K.register({
	f = {
		name = "file",
		t = { "<cmd>Neotree toggle<cr>", "File Tree" },
	},

	t = {
		name = "text",
		f = { "<cmd>Telescope live_grep<cr>", "Live grep" },
		g = { "<cmd>Telescope git_files<cr>", "Git files" },
	},

	b = {
		J = { "<cmd>BufferLineMovePrev<cr>", "Move buffer to left" },
		j = { "<cmd>BufferLineCyclePrev<cr>", "Cycle buffer to left" },

		K = { "<cmd>BufferLineMoveNext<cr>", "Move buffer to right" },
		k = { "<cmd>BufferLineCycleNext<cr>", "Cycle buffer to right" },

		c = { "<cmd>bd<cr>", "Close Buffer" },
		d = { harpoonMark.toggle_mark, "Toggle mark" },
		a = { harpoonMark.add_mark, "add mark" },
	},

	m = { "<cmd>Telescope harpoon marks<cr>", "View marks" },

	[" "] = { "<cmd>Telescope find_files<cr>", "Find File" },
}, { prefix = "<leader>" })
