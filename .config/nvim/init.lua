vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.shiftwidth= 4
vim.o.wrap = false
vim.o.wrapscan = true
vim.o.ignorecase = true
vim.o.scrolloff = 2



vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>m', ':update<CR>, :make<CR>')
vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>mm', ':Mason<CR>')
vim.keymap.set('n', '<leader>c', ':close<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>gs', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>`', ':e ~/.config/nvim/init.lua<CR>')

vim.keymap.set('n', '<leader>1', ':colorscheme gruvbox<CR>')
vim.keymap.set('n', '<leader>2', ':colorscheme kanagawa<CR>')

vim.pack.add({
	{src = "https://github.com/neovim/nvim-lspconfig.git"},
	{src = "https://github.com/windwp/nvim-autopairs.git"},
	{src = "https://github.com/mason-org/mason.nvim.git"},
	{src = "https://github.com/morhetz/gruvbox"},
	{src = "https://github.com/stevearc/oil.nvim.git"},
	{src = "https://github.com/nvim-mini/mini.icons.git"},
	{src = "https://github.com/nvim-treesitter/nvim-treesitter.git"},
	{src = "https://github.com/ibhagwan/fzf-lua.git"},
	{src = "https://github.com/brenoprata10/nvim-highlight-colors.git"},
	{src = "https://github.com/saghen/blink.cmp.git"},
	{src = "https://github.com/rebelot/kanagawa.nvim.git"},
	{src = "https://github.com/lewis6991/gitsigns.nvim.git"},
})

require("nvim-autopairs").setup()
require("mason").setup()
require("oil").setup()
require("fzf-lua").setup()
require("nvim-highlight-colors").setup()
require("nvim-treesitter").setup()
require("gitsigns").setup()
require("blink.cmp").setup({
	keymap = {preset = "super-tab"}
})

require("mini.icons").setup({
	directory = {
		downloads = {glyph = '󰉍', hl = 'MiniIconsOrange'},
		music = {glyph = '󱍙', hl = 'MiniIconsOrange'}
	}	
})


vim.lsp.enable({"glsl_analyzer", "clangd", "intelephense", "ts_ls", "html", "cssls", "gdscript"})

vim.cmd("set background=dark")

vim.cmd[[set completeopt+=menuone,noselect,popup]]




