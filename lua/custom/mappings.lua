local M = {}

M.disabled = {
  n = {
    -- default map to tabufline may cause <C-i> acting as <tab>
    ["<C-i>"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
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
		["<C-c>"] = { "\"+y", "copy" }
	}
}

return M
