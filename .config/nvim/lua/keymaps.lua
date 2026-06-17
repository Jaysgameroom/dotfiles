vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>gs', ':update<CR> :source<CR>')

vim.keymap.set('n', '<leader>`', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>~', ':e ~/code<CR>')

-- FzfLua
vim.keymap.set('n', '<leader>f1', ':FzfLua files cwd=~/.config<CR>')
vim.keymap.set('n', '<leader>f2', ':FzfLua files cwd=~/code<CR>')
vim.keymap.set('n', '<leader>fo', ':FzfLua oldfiles<CR>')
vim.keymap.set('n', '<leader>fc', ':FzfLua lsp_code_actions<CR>')
vim.keymap.set('n', '<leader>fg', ':FzfLua git_files<CR>')
vim.keymap.set('n', '<leader>fgr', ':FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>ff', ':FzfLua resume<CR>')
vim.keymap.set('n', '<leader>fh', ':FzfLua helptags<CR>')

--CellularAutomaton
vim.keymap.set('n', '<leader>rain', ':CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>scram', ':CellularAutomaton scramble<CR>')

-- vim.keymap.set('n', '<leader>ma', ':update<CR> :make<CR>')
-- vim.keymap.set('n', '<leader>mm', ':Mason<CR>')
-- vim.keymap.set('n', '<leader>c', ':close<CR>')
-- vim.keymap.set('n', '<leader>s', ':split<CR>')
