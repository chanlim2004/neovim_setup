return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotag = { enable = true },
	    ensure_installed = {
		"lua",
		"tsx",
		"javascript",
		"php",
		"c",
		"cpp",
		"c_sharp",
		"python",
		"gdscript"
	    },
	    auto_install = false,
	})
    end
}
