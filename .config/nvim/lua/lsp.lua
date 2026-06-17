require("mason-lspconfig").setup({
	ensure_installed = {"rust_analyzer", "texlab", "html", "lua_ls", "clangd", "ts_ls", "hyprls", "qmlls"}
})

local ftypes = {'python', 'rust', 'latex', 'cpp', 'javascript', 'html', 'css', 'php', 'lua', "java"}

require("nvim-treesitter").setup()
require("nvim-treesitter").install(ftypes)

vim.api.nvim_create_autocmd("FileType", {
	pattern = ftypes,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "hl" }}}}})
