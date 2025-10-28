local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
end
return {
    {
	"bluz71/vim-moonfly-colors",
	--"https://github.com/sainnhe/sonokai",
	--"calind/selenized.nvim",
	config = function ()
	    vim.cmd.colorscheme "moonfly"
	    --enable_transparency()
	end
    },
}

