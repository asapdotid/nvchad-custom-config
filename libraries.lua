---@class ChadrcConfig
local M = {}

-- LSP configs
M.nvim_lspconfig = function(active)
  local config = {}
  if active then
    config = {
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          -- format & linting
          {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
              require("custom.configs.null-ls")
            end,
          },
        },
        config = function()
          require("plugins.configs.lspconfig")
          require("custom.configs.lspconfig")
        end, -- Override to setup mason-lspconfig
      },
    }
  end
  return config
end

-- Mason configs
M.mason = function(active)
  local config = {}
  local mason = require("custom.configs.mason")
  if active then
    config = {
      {
        "williamboman/mason.nvim",
        opts = mason.opts,
      },
    }
  end
  return config
end

M.nvim_treesitter = function(active)
  local config = {}
  if active then
    config = {
      {
        "nvim-treesitter/nvim-treesitter",
        -- opts = overrides.treesitter,
        dependencies = {
          "HiPhish/nvim-ts-rainbow2",
          "HiPhish/rainbow-delimiters.nvim",
        },
        config = function()
          require("custom.configs.treesitter")
        end,
      },
    }
  end
  return config
end

-- Tree configs
M.nvim_tree = function(active)
  local config = {}
  local nvimtree = require("custom.configs.nvimtree")
  if active then
    config = {
      {
        "nvim-tree/nvim-tree.lua",
        opts = nvimtree.opts,
      },
    }
  end
  return config
end

-- Better Escape configs
M.better_escape = function(active)
  local config = {}
  if active then
    config = {
      {
        "max397574/better-escape.nvim",
        config = function()
          require("custom.configs.better-escape")
        end,
      },
    }
  end
  return config
end

-- Conform
M.conform = function(active)
  local config = {}
  if active then
    config = {
      {
        "stevearc/conform.nvim",
        event = "InsertEnter",
        config = function()
          require("custom.configs.conform")
        end,
      },
    }
  end
  return config
end

-- Colorizer configs
M.colorizer = function(active)
  local config = {}
  if active then
    config = {
      {
        "NvChad/nvim-colorizer.lua",
        enabled = true,
        config = function()
          require("custom.configs.colorizer")
        end,
      },
    }
  end
  return config
end

-- Visual Multi configs
M.visualmulti = function(active)
  local config = {}
  if active then
    config = {
      {
        "mg979/vim-visual-multi",
        event = "BufRead",
      },
    }
  end
  return config
end

-- Dubui configs
M.dapui = function(active)
  local config = {}
  if active then
    config = {
      {
        "rcarriga/nvim-dap-ui",
        event = "BufRead",
        dependencies = "mfussenegger/nvim-dap",
        enabled = vim.fn.has("win32") == 0,
        config = function()
          require("custom.configs.dapui")
        end,
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        event = "BufRead",
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        enabled = vim.fn.has("win32") == 0,
        init = function()
          require("custom.configs.mason-dap")
        end,
      },
    }
  end
  return config
end

-- CMP cmdline configs
M.cmp_cmdline = function(active)
  local config = {}
  local noice = require("custom.configs.noice")
  if active then
    config = {
      {
        "folke/noice.nvim",
        event = "BufWinEnter",
        dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
        },
        opts = noice.opts,
        keys = noice.keys,
      },
      {
        "hrsh7th/cmp-cmdline",
        event = "VeryLazy",
        config = function()
          require("custom.configs.cmp-cmdline")
        end,
      },
    }
  end
  return config
end

-- Indent Blankline
M.indent_blankline = function(active)
  local config = {}
  if active then
    config = {
      {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
          require("custom.configs.indent-blankline")
        end,
        -- opts = require("custom.configs.indent-blankline"),
      },
    }
  end
  return config
end

-- Only load whichkey after all the gui
M.which_key = function(active)
  local config = {}
  local which_key = require("custom.configs.which-key")
  if active then
    config = {
      {
        "folke/which-key.nvim",
        keys = { "<leader>", '"', "'", "`", "c", "v" },
        init = function()
          require("core.utils").load_mappings("whichkey")
        end,
        opts = which_key.opts,
      },
    }
  end
  return config
end

-- Deressing configs
M.dressing = function(active)
  local config = {}
  if active then
    config = {
      {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
          end
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
          end
        end,
      },
    }
  end
  return config
end

M.surround = function(active)
  local config = {}
  if active then
    config = {
      {
        "kylechui/nvim-surround",
        version = "main",
        event = "VeryLazy",
        config = function()
          require("custom.configs.surround")
        end,
      },
    }
  end
  return config
end

M.hop = function(active)
  local config = {}
  if active then
    config = {
      {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
          require("custom.configs.hop")
        end,
      },
    }
  end
  return config
end

return M
