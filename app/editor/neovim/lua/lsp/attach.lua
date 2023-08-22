local function asyncFormat()
	vim.lsp.buf.format {
		async = true,
	}
end
return {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),

	on_attach = function(client, buf)
		require "telescope"

		local K = require "which-key"

		K.register({
			K = { vim.lsp.buf.hover, "Hover over item" },
			l = {
				name = "LSP",
				a = { vim.lsp.buf.code_action, "Run code actions" },
				r = { vim.lsp.buf.rename, "Rename" },
				f = { asyncFormat, "Format" },
			},

			g = {
				name = "GoTo",
				t = { vim.lsp.buf.type_definition, "Go to the type definition" },
				d = { vim.lsp.buf.definition, "Go to the definition" },
				D = { vim.lsp.buf.declaration, "Go to the declaration" },
				i = { vim.lsp.buf.implementation, "Go to the implementation" },
				R = { vim.lsp.buf.references, "Go to references" },
			},
		}, { prefix = "<leader>", buffer = buf, noremap = true })
		require("lsp-format").on_attach(client, buf)
	end,
}
