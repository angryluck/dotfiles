-- stylua: ignore start

-- [[ Basic Keymaps ]]
-- mapleader = " " and maplocalleader = " " are set in init.lua

-- Combined with 'vim.opt.hlssearch = true'
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "gk", "v:count == 0 ? 'k' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "gj", "v:count == 0 ? 'j' : 'j'", { expr = true, silent = true })

-- Simpler way to paste last *yanked* think (ignoring deletes)
-- Does overwrite default command, which pastes and puts cursor after, but
-- whatever
vim.keymap.set("n", "gp", '"0p', {desc = "Paste last yank", silent=true})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end,
  { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Easier window movement (but conflicts with Harpoon)
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })
----- Conflicts with vimtex!
-- vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the upper window" })


-- LSP-commands (see :help vim.lsp.buf)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover) -- KK to focus hover window
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.rename)

-- Open Oil easy
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Switch buffers quickly
vim.keymap.set("n", "<leader>n", vim.cmd.bnext )
vim.keymap.set("n", "<leader>p", vim.cmd.bprev )
-- Floating terminal
-- vim.keymap.set("n", "tt", "<cmd>Floaterminal<cr>", { desc = "[T]oggle [T]erminal" })


vim.lsp.get_clients()
