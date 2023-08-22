local lspconfig = require "lspconfig"
local attach = require "lsp.attach"
local mod = {}

function mod.configure(server_name)
	return function(config)
		local newConfig = vim.tbl_extend("force",  attach, config)
		lspconfig[server_name].setup(newConfig)
	end
end

return mod
