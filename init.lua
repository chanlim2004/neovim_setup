require('config.option')
require('config.lsp')
require('config.keybinds')
require('config.lazy')
require('config.dapconfig')
require('config.barKey')
vim.api.nvim_create_autocmd("SwapExists", {
    callback = function()
        -- 'e' means 'Edit the file anyway', which bypasses the prompt.
        vim.g.swapchoice = 'e' 
    end,
})
require('blink.cmp').setup({
  fuzzy = {
    implementation = 'lua', -- This will stop the warning and use the pure Lua fuzzy matcher
  },
})
