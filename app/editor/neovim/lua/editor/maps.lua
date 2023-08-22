local K = require("which-key")

K.register({
	f = {
		name = "file",
		t = { "<cmd>Neotree<cr>", "File Tree" },
	},

	[" "] = { "<cmd>Telescope find_files<cr>", "Find File" },
}, { prefix = "<leader>" })
