return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Required for filetype icons
    "lewis6991/gitsigns.nvim",    -- Optional: for git status indicators
  },
  init = function()
    vim.g.barbar_auto_setup = false -- Prevent barbar from setting up automatically
  end,
  config = function()
    require("barbar").setup {
      -- Your barbar.nvim configuration options go here
      -- Example:
      -- auto_hide = true,
      -- icons = {
      --   buffer_index = true,
      --   buffer_number = false,
      --   diagnostics = {
      --     [vim.diagnostic.severity.ERROR] = {enabled = true, icon = "●"},
      --     [vim.diagnostic.severity.WARN] = {enabled = true, icon = "●"},
      --     [vim.diagnostic.severity.INFO] = {enabled = true, icon = "●"},
      --     [vim.diagnostic.severity.HINT] = {enabled = true, icon = "●"},
      --   },
      -- },
    }
  end,
}

