return{
    "neovim/nvim-lspconfig",
    event = "BufReadPost", -- Load after a buffer is read
    -- or use other events like "BufEnter", "VeryLazy", or specific FileType events
    -- For example: ft = { "lua", "python", "javascript" }
    config = function()
	-- Your nvim-lspconfig setup goes here
	require("lspconfig").lua_ls.setup {}
	require("lspconfig").pyright.setup {}
	require("lspconfig").ts_ls.setup{}
	require("lspconfig").omnisharp.setup {}
    end,
}
