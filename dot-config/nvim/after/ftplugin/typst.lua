vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tw = 0 -- One sentence pr. line!
vim.keymap.set("i", "<C-f>", function() vim.cmd("write") end)
