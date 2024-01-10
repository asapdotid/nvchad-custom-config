local M = {}

M.opts = {
  ensure_installed = {
    -- markdown
    "marksman",
    "misspell",

    -- lua
    "lua-language-server",
    "stylua",

    -- web development
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",
    "hadolint",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- go
    "gopls",
    "goimports",

    -- python
    "pyright",
    "flake8",
    "black",

    -- terraform
    "terraform-ls",
    "tflint",

    -- yaml
    "yaml-language-server",
    "yamllint",

    -- json
    "json-lsp",

    -- shell
    "shfmt",

    -- css
    "css-lsp",
    "tailwindcss-language-server",

    -- sql
    "sqlls",

    -- ansible
    "ansible-language-server",
    "ansible-lint",

    -- makefile
    "cmakelint",
    "cmake-language-server",
  },
}

return M
