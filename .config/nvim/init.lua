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
vim.keymap.set('n', '<leader>ma', ':update<CR> :make<CR>')
vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>mm', ':Mason<CR>')
vim.keymap.set('n', '<leader>c', ':close<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>o', 'r:<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>gs', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>`', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>rain', ':CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>scram', ':CellularAutomaton scramble<CR>')
vim.keymap.set('n', '<leader>~', ':e ~/code<CR>')

vim.keymap.set('n', '<leader>1', ':colorscheme gruvbox<CR>')
vim.keymap.set('n', '<leader>9', ':colorscheme vscode<CR>')




vim.pack.add({

	--Navigation
		--file explorer
	{src = "https://github.com/stevearc/oil.nvim.git"},
		--fuzzy find
	{src = "https://github.com/ibhagwan/fzf-lua.git"},
		--text objects
	{src = "https://github.com/nvim-mini/mini.ai.git"},
	{src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git"},

	--Editing
		--autocomplete
	{src = "https://github.com/saghen/blink.cmp.git"},
		--autpairs
	{src = "https://github.com/windwp/nvim-autopairs.git"},
	{src = "https://github.com/windwp/nvim-ts-autotag.git"},

	--Parsing
		--lsp
	{src = "https://github.com/mason-org/mason.nvim.git"},
	{src = "https://github.com/neovim/nvim-lspconfig.git"},
	{src = "https://github.com/mason-org/mason-lspconfig.nvim.git"},
		--treesitter
	{src = "https://github.com/nvim-treesitter/nvim-treesitter.git"},

	{src = "https://github.com/j-hui/fidget.nvim.git"},

	--Cosmetic
		--icons
	{src = "https://github.com/nvim-mini/mini.icons.git"},
		--color highlighting
	{src = "https://github.com/brenoprata10/nvim-highlight-colors.git"},

	{src = "https://github.com/ellisonleao/gruvbox.nvim.git"},
	{src = "https://github.com/Mofiqul/vscode.nvim.git"},
		--git-signs
	{src = "https://github.com/lewis6991/gitsigns.nvim.git"},
	{src = "https://github.com/nvim-mini/mini.surround.git"},
		--markdown
	{src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git"},
		--animation
	{src = "https://github.com/karb94/neoscroll.nvim.git"},

	--Fun
	{src = "https://github.com/Eandrju/cellular-automaton.nvim.git"},
})


require("nvim-autopairs").setup()
require("mason").setup()
require("oil").setup()
require("fzf-lua").setup()
require("nvim-highlight-colors").setup()
require("nvim-treesitter").setup()
require("gitsigns").setup()
require("mini.surround").setup()
require("fidget").setup()
require("nvim-ts-autotag").setup()

require("neoscroll").setup({
	duration_multiplier = 0.3
})


local ai = require('mini.ai').gen_spec

require('mini.ai').setup({
	custom_textobjects = {
		f = ai.treesitter({ a = '@function.outer', i = '@function.inner' }),
		o = ai.treesitter({
			a = { '@conditional.outer', '@loop.outer' },
			i = { '@conditional.inner', '@loop.inner' },
		}),
		c = ai.treesitter({ a = "@class.outer", i = "@class.inner"}),
		u = ai.function_call()

	}
})

require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "clangd", "ts_ls", "hyprls"}
})


local ftypes = {'cpp', 'javascript', 'html', 'css', 'php', 'lua', "java"}


vim.o.syntax = off

require("nvim-treesitter").setup()
require("nvim-treesitter").install(ftypes)

require("blink.cmp").setup({
	keymap = {preset = "super-tab"},
	fuzzy = {implementation = "lua"},
})

require("mini.icons").setup({
	directory = {
		downloads = {glyph = '󰉍', hl = 'MiniIconsOrange'},
		music = {glyph = '󱍙', hl = 'MiniIconsOrange'}
	}
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = ftypes,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
})


vim.diagnostic.config({
	virtual_text = {
		prefix = "■",
		source = "if_many",
		spacing = 4,
	},
	float = {
		focusable = false,
		border = "rounded",
		source = "always"
	}
})


vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
		vim.highlight.on_yank({timeout=10})
  end,
})




vim.cmd("set background=dark")
vim.cmd("colorscheme gruvbox")

vim.cmd[[set completeopt+=menuone,noselect,popup]]

