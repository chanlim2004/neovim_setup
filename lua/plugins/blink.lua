return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    config = function()
      require("blink.cmp").setup({
        -- **The new fuzzy block goes here**
        fuzzy = {
          implementation = 'lua', -- This stops the warning and uses the Lua matcher
        },
        -- The rest of your existing configuration follows
        completion = {
          list = {
          },
        },
        keymap = {
          preset = "super-tab",
        },
      })
    end,
  },
}
