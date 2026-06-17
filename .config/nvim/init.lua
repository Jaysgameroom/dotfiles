require("options")
require("keymaps")

vim.pack.add({
	--Navigation
		--file explorer
	{src = "https://github.com/stevearc/oil.nvim.git"},
		--fuzzy find
	{src = "https://github.com/ibhagwan/fzf-lua.git"},
		--text objects
	{src = "https://github.com/nvim-mini/mini.ai.git"},

	--Editing
		--autocomplete
	{src = "https://github.com/saghen/blink.cmp.git"},
		--autopairs
	{src = "https://github.com/windwp/nvim-autopairs.git"},
	{src = "https://github.com/windwp/nvim-ts-autotag.git"},
		--surround
	{src = "https://github.com/nvim-mini/mini.surround.git"},
		--snippets
	{src = "https://github.com/L3MON4D3/LuaSnip.git"},

	--Parsing
		--lsp
	{src = "https://github.com/mason-org/mason.nvim.git"},
	{src = "https://github.com/neovim/nvim-lspconfig.git"},
	{src = "https://github.com/mason-org/mason-lspconfig.nvim.git"},
	{src = "https://github.com/j-hui/fidget.nvim.git"},
		--treesitter
	{src = "https://github.com/nvim-treesitter/nvim-treesitter.git"},
	{src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git"},

	--Cosmetic
		--icons
	{src = "https://github.com/nvim-mini/mini.icons.git"},
		--color highlighting
	{src = "https://github.com/brenoprata10/nvim-highlight-colors.git"},
		--colorschemes
	{src = "https://github.com/ellisonleao/gruvbox.nvim.git"},
		--git-signs
	{src = "https://github.com/lewis6991/gitsigns.nvim.git"},
		--markdown
	{src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git"},
		--animation
	{src = "https://github.com/karb94/neoscroll.nvim.git"},

	--Fun
	{src = "https://github.com/Eandrju/cellular-automaton.nvim.git"},
	{src = "https://github.com/lervag/vimtex.git"},
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

require("luasnip").setup({enable_autosnippets = true})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})

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
		p = ai.treesitter({ a = "@parameter.outer", i = "@parameter.inner"}),
		c = ai.function_call()

	}
})

require("mason-lspconfig").setup({
	ensure_installed = {"rust_analyzer", "texlab", "html", "lua_ls", "clangd", "ts_ls", "hyprls", "qmlls"}
})


local ftypes = {'python', 'rust', 'latex', 'cpp', 'javascript', 'html', 'css', 'php', 'lua', "java"}


vim.o.syntax = off

require("nvim-treesitter").setup()
require("nvim-treesitter").install(ftypes)

require("blink.cmp").setup({
	keymap = {preset = "super-tab"},
	fuzzy = {implementation = "lua"},
	snippets = {preset = "luasnip"},
	completion = {
		trigger = {
			show_in_snippet = false
		}
	}
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
		vim.highlight.on_yank({higroup="Seach", timeout=15})
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
		vim.highlight.on_yank({timeout=15})
  end,
})

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_impas_enabled = 0
vim.g.vimtex_compiler_latexmk = {
	options = {
		'-synctex=0'
	}
}

vim.keymap.set('n', '<leader>gp', require"gitsigns".preview_hunk_inline)
vim.keymap.set('n', '<leader>gr', require"gitsigns".reset_hunk)

vim.cmd("set background=dark")
vim.cmd("colorscheme gruvbox")

vim.keymap.set("i", "<C-K>", function() require("luasnip").change_choice(1) end)


vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "hl" }}}}})
