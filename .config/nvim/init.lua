require("options")
require("keymaps")
require("decoration")
require("lsp")
require("treesitter")
require("cmp")
require("oil1")

vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
})

require("nvim-autopairs").setup()
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

