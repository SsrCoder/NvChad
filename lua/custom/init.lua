local opt = vim.opt

opt.clipboard:remove { "unnamedplus" }

local custom_group = vim.api.nvim_create_augroup('custom_group', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'go',
	group = custom_group,
	desc = 'set indent for go files',
	callback = function ()
		-- Indenting
		opt.expandtab = false
		opt.shiftwidth = 4
		opt.smartindent = true
		opt.tabstop = 4
		opt.softtabstop = 4
	end
})
