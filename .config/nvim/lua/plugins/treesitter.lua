return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		require('nvim-treesitter').setup {
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath('data') .. '/site'
		}
		require("nvim-treesitter").install({
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"python",
			"yaml",
			"cpp",
		})


		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"python",
				"yaml",
				"cpp",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
