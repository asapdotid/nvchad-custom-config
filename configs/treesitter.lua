require("nvim-treesitter.configs").setup({
  -- Add a language of your choice
  ensure_installed = {
    "bash",
    "bash",
    "c",
    "cmake",
    "css",
    "dockerfile",
    "dot",
    "git_config",
    "go",
    "hcl",
    "html",
    "ini",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown_inline",
    "markdown",
    "php",
    "python",
    "rasi",
    "regex",
    "rust",
    "sql",
    "ssh_config",
    "ssh_config",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    query = "rainbow-parens",
    -- Highlight the entire buffer all at once
    strategy = require("ts-rainbow.strategy.global"),
    -- Do not enable for files with more than n lines
    max_file_lines = 3000,
  },
})
