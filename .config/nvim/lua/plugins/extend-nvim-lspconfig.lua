local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        --        clangd = {
        --          cmd = {
        --            "clangd",
        --            "--background-index",
        --            "--clang-tidy",
        --            "--header-insertion=iwyu",
        --            "--completion-style=detailed",
        --            "--function-arg-placeholders",
        --            "--fallback-style=llvm",
        --            -- Thomas: Added to let clangd work with gcc.
        --            "--query-driver=/usr/bin/clang-*,/usr/bin/g++,/usr/bin/c++,/usr/bin/cc,/usr/bin/gcc*,/opt/ros/humble",
        --          },
        --        },
        bashls = {
          filetypes = { "sh", "zsh" },
        },
      },
    },
  },
}
