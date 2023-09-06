local configure = require("lsp.utils").configure

configure "clangd" {
        cmd = {
                "clangd",
                "--header-insertion=never",
                "--clang-tidy",
                "--background-index",
                "--enable-config",
                "--malloc-trim",
                "--pch-storage=disk",
                "--fallback-style=LLVM"
        }
}
