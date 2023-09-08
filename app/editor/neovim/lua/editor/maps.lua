local K = require "which-key"

local opts = {
	silent = true,
	noremap = true,
}

vim.keymap.set({ "n", "x" }, "<ESCAPE>", "<cmd>nohl<cr>", opts)
K.register({
	f = {
		name = "file",
		t = { "<cmd>Neotree<cr>", "File Tree" },
	},

	b = {
		J = { "<cmd>BufferLineMovePrev<cr>", "Move buffer to left" },
		j = { "<cmd>BufferLineCyclePrev<cr>", "Move buffer to left" },

		K = { "<cmd>BufferLineMoveNext<cr>", "Move buffer to right" },
		k = { "<cmd>BufferLineCycleNext<cr>", "Move buffer to right" },
	},

	[" "] = { "<cmd>Telescope find_files<cr>", "Find File" },
}, { prefix = "<leader>" })
