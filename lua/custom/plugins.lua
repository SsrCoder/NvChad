local plugins = {
	-- In order to modify the `lspconfig` configuration:
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},
	-- this opts will extend the default opts
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "go" },
			-- additional_vim_regex_highlighting = true,
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			local r = require "custom.configs.telescope"
			print(r)
			return r
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			local null_ls = require("null-ls")

			local options = {
				sources = {
					null_ls.builtins.formatting.gofumpt,
					-- require("custom.configs.formatting.goimports"),
					null_ls.builtins.formatting.goimports,
					-- null_ls.builtins.formatting.golines,
				},

				on_attach = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						callback = function()
							-- vim.lsp.buf.format({ timeout_ms = 1000 })
							vim.lsp.buf.format()
						end,
					})
				end
			}

			return options
		end,

		config = function(_, opts)
			require("null-ls").setup(opts)
		end
	},

  {
    "ojroques/nvim-osc52",
    opts = {},
    config = function (_, opts)
      require("osc52").setup(opts)
    end,
  },

	{
		"github/copilot.vim",
		event = "VeryLazy",
		cmd = { "Copilot" },
	},

	{
		"ahmedkhalf/project.nvim",
		opts = {
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
		end,
	},

	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = {

		},
		config = function(_, opts)
			require("neodev").setup(opts)
		end

	},

	--[[
  {
    "mhartington/formatter.nvim",
	cmd = { "Format" },
	
	opts = {
			filetype = {
				go = {
					require("formatter.filetypes.go").goimports,
				}
			}
		},

	config = function (_, opts)
			vim.cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
			]]

	--[[
		require("formatter").setup(opts)
	end,
  },
	--]]

}

return plugins
