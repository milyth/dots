local function asyncFormat()
        vim.lsp.buf.format {
                async = false,
        }
end
return {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),

        on_attach = function(client, buf)
                require "telescope"

                local K = require "which-key"

                K.register({
                        k = { ":Lspsaga hover_doc<cr>", "Hover over item" },
                        l = {
                                name = "LSP",
                                a = { vim.lsp.buf.code_action, "Run code actions" },
                                r = {  vim.lsp.buf.rename, "Rename" },
                                f = { asyncFormat, "Format" },
                        },

                        g = {
                                name = "Goto",
                                t = { vim.lsp.buf.type_definition, "Go to the type definition" },
                                d = { vim.lsp.buf.definition, "Go to the definition" },
                                D = { vim.lsp.buf.declaration, "Go to the declaration" },
                                i = { vim.lsp.buf.implementation, "Go to the implementation" },
                                R = { vim.lsp.buf.references, "Go to references" },

                                k = { ":Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
                                l = { ":Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },
                                u = { ":Lspsaga incoming_calls<cr>", "View Incoming Calls " },
                        },
                }, { prefix = "<leader>", buffer = buf, noremap = true
        })

        end,
}
