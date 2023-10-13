local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	print "Boostraping lazy.nvim!"
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}
end

vim.loader.enable()
vim.opt.rtp:prepend(lazypath)
require "editor"

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.opt.foldmethod:get() == "expr" then
			vim.schedule(function()
				vim.opt.foldmethod = "expr"
			end)
		end
	end,
})
