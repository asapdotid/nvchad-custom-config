---@class ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

-- Override UI elements
local ui = require("custom.ui")

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  nvdash = ui.nvdash,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = ui.statusline,
  term = ui.term,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

--  Format on save
M.format_on_save = 1 -- 1=true 0=false

return M
