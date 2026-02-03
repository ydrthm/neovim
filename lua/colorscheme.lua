return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
	       transparent = {
	           enabled = true,
               normalfloat = false,
               pmenu = false,
               lazy = false,
               mason = false,
	       },
	       styles = {
               enabled = false,
	       },
	   },
	config = function(_, opts)
		vim.o.background = "dark"
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
	end,
}
