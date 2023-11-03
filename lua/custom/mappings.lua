local M = {}

M.disabled = {
  n = {
    -- default map to tabufline may cause <C-i> acting as <tab>
    ["<C-i>"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>ra"] = "",
  }
}

M.general = {
	n = {
		["J"] = { "5j", "5 lines down", opts = { noremap = true } },
		["K"] = { "5k", "5 lines up", opts = { noremap = true } },
		-- ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		["<C-t>"] = { "<cmd> Telescope projects <CR>", "find projects" },

    ["<leader>n"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
		-- ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		-- ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
		-- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		-- ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
		--
		-- -- git
		-- ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
		-- ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
		--
		-- -- pick a hidden term
		-- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
		--
		-- -- theme switcher
		-- ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
	},
	i = {
		["jj"] = { "<Esc>", "Escept insert mode", opts = { nowait = true } },
	},
	v = {
	}
}

M.osc52 = {
  n = {
    ["<C-c>"] = { function () require("osc52").copy_operator() end, "copy", opts={ expr=true } }
  },
  v = {
		["<C-c>"] = { function () require("osc52").copy_visual() end, "copy" }
  }
}

M.refactoring = {
  v = {
    ["<leader>rf"] = { function () require("refactoring").refactor("Extract Function") end, "Extract Function", opts = { noremap = true, silent = true }},
    ["<leader>rv"] = { function () require("refactoring").refactor("Extract Variable") end, "Extract Variable", opts = { noremap = true, silent = true }},
    ["<leader>ri"] = { function () require("refactoring").refactor("Inline Variable") end, "Inline Variable", opts = { noremap = true, silent = true }},
    ["<leader>rr"] = { function () require('telescope').extensions.refactoring.refactors() end, "Show Refactors", opts = { noremap = true }},
  },
  n = {
    ["<leader>ri"] = { function () require("refactoring").refactor("Inline Variable") end, "Inline Variable", opts = { noremap = true, silent = true }},
    ["<leader>rb"] = { function () require("refactoring").refactor("Extract Block") end, "Extract Block", opts = { noremap = true, silent = true }},
    ["<leader>rr"] = { function () require('telescope').extensions.refactoring.refactors() end, "Show Refactors", opts = { noremap = true }},
    ["<leader>rn"] = { function () require("nvchad_ui.renamer").open() end, "LSP rename" },
  },
}

return M
