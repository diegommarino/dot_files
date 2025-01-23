return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<F2>", ":Neotree filesystem left toggle<CR>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<F3>", ":Neotree reveal<CR>", {})
	end,
}
