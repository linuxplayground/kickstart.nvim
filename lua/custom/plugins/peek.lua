return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup {
      app = 'wslview',
    }
    -- refer to `configuration to change defaults`
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

    vim.keymap.set('n', '<leader>po', ':PeekOpen<CR>', { silent = true })
    vim.keymap.set('n', '<leader>pc', ':PeekClose<CR>', { silent = true })
  end,
}
