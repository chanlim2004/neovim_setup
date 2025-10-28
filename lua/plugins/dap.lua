return {
    -- Core Mason and DAP Plugins
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",

    -- The MISSING dependency
    "nvim-neotest/nvim-nio",

    -- nvim-dap-ui configuration (now correctly listing nvim-nio as a dependency)
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

	-- Your existing Mason-DAP helper
	{
	    "jay-babu/mason-nvim-dap.nvim",
	    dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	    },
	    opts = { handlers = {} }
	},
}
