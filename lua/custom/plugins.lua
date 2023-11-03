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
    "mhartington/formatter.nvim",
    -- cmd = { "Format", "FormatWrite" },
    event = "VeryLazy",
    opts = function()
      local util = require "formatter.util"

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          -- vim.lsp.buf.format({ timeout_ms = 1000 })
          vim.lsp.buf.format()
        end,
      })

      return {
        logging = false,
        log_level = vim.log.levels.WARN,
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
              -- Supports conditional formatting
              if util.get_current_buffer_file_name() == "special.lua" then
                return nil
              end

              -- Full specification of configurations is down below and in Vim help
              -- files
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },

          go = {
            function()
              return {
                exe = "goimports",
                args = { "-w" },
                stdin = false,
              }
            end,
          },

          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_exec(
        [[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost * FormatWrite
        augroup END
      ]],
        true
      )
      require("formatter").setup(opts)
    end,
  },

  -- {
  -- 	"jose-elias-alvarez/null-ls.nvim",
  -- 	event = "VeryLazy",
  -- 	opts = function()
  -- 		local null_ls = require("null-ls")
  --
  -- 		local options = {
  -- 			sources = {
  -- 				null_ls.builtins.formatting.gofumpt,
  -- 				-- require("custom.configs.formatting.goimports"),
  -- 				null_ls.builtins.formatting.goimports,
  -- 				-- null_ls.builtins.formatting.golines,
  -- 			},
  --
  -- 			on_attach = function()
  -- 				vim.api.nvim_create_autocmd("BufWritePre", {
  -- 					callback = function()
  -- 						-- vim.lsp.buf.format({ timeout_ms = 1000 })
  -- 						vim.lsp.buf.format()
  -- 					end,
  -- 				})
  -- 			end
  -- 		}
  --
  -- 		return options
  -- 	end,
  --
  -- 	config = function(_, opts)
  -- 		require("null-ls").setup(opts)
  -- 	end
  -- },

  {
    "ojroques/nvim-osc52",
    opts = {},
    config = function(_, opts)
      require("osc52").setup(opts)
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    opts = {
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
    end,
  },

  -- {
  -- 	"github/copilot.vim",
  -- 	event = "VeryLazy",
  -- 	cmd = { "Copilot" },
  -- },
  --
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },

  {
    "folke/neodev.nvim",
    ft = "lua",
    opts = {},
    config = function(_, opts)
      require("neodev").setup(opts)
    end,
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
