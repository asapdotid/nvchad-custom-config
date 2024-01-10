local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "json", "javascript", "typescript" } }), -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- bash
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  -- yaml
  b.formatting.yamlfmt,

  -- rust
  b.formatting.rustfmt,

  -- go
  b.formatting.gofmt,
  b.formatting.goimports,

  -- python
  b.formatting.black,
  b.diagnostics.flake8,

  -- markdown
  b.diagnostics.markdownlint,

  -- json
  b.diagnostics.jsonlint,

  -- ansible
  b.diagnostics.ansiblelint,

  -- terraform
  b.diagnostics.terraform_fmt,

  -- docker
  b.diagnostics.hadolint,
}

null_ls.setup({
  debug = true,
  sources = sources,
})

-- add autocmds to run formatting on save for .go, .rs, and .py files
vim.cmd([[
  augroup null_ls_formatting
    autocmd!
    autocmd BufWritePre *.go lua vim.lsp.buf.format((nil, 1000)
    autocmd BufWritePre *.rs lua vim.lsp.buf.format((nil, 1000)
    autocmd BufWritePre *.py lua vim.lsp.buf.format((nil, 1000)
  augroup END
]])
