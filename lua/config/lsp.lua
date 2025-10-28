local lspconfig = require("lspconfig")
vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ts_ls",
    "omnisharp",
})
lspconfig.gdscript.setup({
    cmd = {'ncat', '127.0.0.1', '6005'}, -- Replace '6005' if you've changed the port in Godot
    root_dir = lspconfig.util.root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3'},
    -- Other settings...
})
vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
