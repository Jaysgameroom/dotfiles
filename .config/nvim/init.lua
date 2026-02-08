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
vim.keymap.set('n', '<leader>ahhhh', ':CellularAutomaton make-it_rain<CR>')

vim.keymap.set('n', '<leader>1', ':colorscheme gruvbox<CR>')
vim.keymap.set('n', '<leader>2', ':colorscheme kanagawa<CR>')
vim.keymap.set('n', '<leader>3', ':colorscheme catppuccin<CR>')
vim.keymap.set('n', '<leader>4', ':colorscheme onedark<CR>')
vim.keymap.set('n', '<leader>5', ':colorscheme tokyonight<CR>')
vim.keymap.set('n', '<leader>6', ':colorscheme everforest<CR>')
vim.keymap.set('n', '<leader>7', ':colorscheme nord<CR>')
vim.keymap.set('n', '<leader>8', ':colorscheme monokai<CR>')
vim.keymap.set('n', '<leader>9', ':colorscheme vscode<CR>')



vim.pack.add({

	--Navigation
		--?
	{src = "https://github.com/folke/flash.nvim.git"},
		--file explorer
	{src = "https://github.com/stevearc/oil.nvim.git"},
		--fuzzy find
	{src = "https://github.com/ibhagwan/fzf-lua.git"},
		--treesitter stuff
	{src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git"},

	--Editing
		--autocomplete
	{src = "https://github.com/saghen/blink.cmp.git"},
		--autpairs
	{src = "https://github.com/windwp/nvim-autopairs.git"},


	--Parsing
		--lsp
	{src = "https://github.com/mason-org/mason.nvim.git"},
	{src = "https://github.com/neovim/nvim-lspconfig.git"},
		--treesitter
	{src = "https://github.com/nvim-treesitter/nvim-treesitter.git"},

	{src = "https://github.com/j-hui/fidget.nvim.git"},

	--Cosmetic
		--icons
	{src = "https://github.com/nvim-mini/mini.icons.git"},
		--color highlighting
	{src = "https://github.com/brenoprata10/nvim-highlight-colors.git"},
		--colorschemes
	{src = "https://github.com/rebelot/kanagawa.nvim.git"},
	{src = "https://github.com/joshdick/onedark.vim.git"},
	{src = "https://github.com/catppuccin/nvim.git"},
	{src = "https://github.com/folke/tokyonight.nvim.git"},
	{src = "https://github.com/sainnhe/everforest.git"},
	{src = "https://github.com/shaunsingh/nord.nvim.git"},
	{src = "https://github.com/tanvirtin/monokai.nvim.git"},
	{src = "https://github.com/Mofiqul/vscode.nvim.git"},
	{src = "https://github.com/ellisonleao/gruvbox.nvim.git"},
		--git-signs
	{src = "https://github.com/lewis6991/gitsigns.nvim.git"},
	{src = "https://github.com/nvim-mini/mini.surround.git"},

	{src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git"},

	--Fun
	{src = "https://github.com/Eandrju/cellular-automaton.nvim.git"},
	{src = "https://github.com/rafamadriz/friendly-snippets.git"},
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


ftypes = {'cpp', 'javascript', 'lua', "java"}

require("nvim-treesitter").setup()
require("nvim-treesitter").install(ftypes)

vim.o.syntax = off

vim.api.nvim_create_autocmd('FileType', {
  pattern = ftypes,
  callback = function() 
	  	vim.treesitter.start() 
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})


require("flash").setup()

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

require("gruvbox").setup({
	contrast = "",
	transparent_mode = false
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

vim.lsp.enable({"jdtls", "rust_analyzer", "clangd", "intelephense", "ts_ls", "html", "cssls"})

vim.cmd("set background=dark")
vim.cmd("colorscheme gruvbox")

vim.cmd[[set completeopt+=menuone,noselect,popup]]

vim.keymap.set({ "x", "o" }, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)

-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end) 

vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@function.outer"
end)

vim.keymap.set("n", "zf", function() require("flash").jump() end )
