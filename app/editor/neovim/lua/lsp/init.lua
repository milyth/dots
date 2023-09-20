local configure = require("lsp.utils").configure

local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require "lsp.client.lua_ls"
require "lsp.client.clangd"
require "lsp.client.zls"
require "lsp.client.lemminx"
require "lsp.client.bashls"
require "lsp.client.pyright"
require "lsp.client.csharp_ls"
require "lsp.client.html"
require "lsp.client.tsserver"

configure "emmet_ls" {}
configure "cssls" {}
configure "tailwindcss" {}
configure "gopls" {}
