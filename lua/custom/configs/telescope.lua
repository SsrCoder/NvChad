local actions = require("telescope.actions")

local options = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },

  extensions_list = { "themes", "terms", "projects", "refactoring" },
}

return options
