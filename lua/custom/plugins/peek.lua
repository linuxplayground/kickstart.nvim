return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup {
      app = 'wslview',
    }

    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

    vim.keymap.set('n', '<leader>po', ':PeekOpen', { silent = true })
    vim.keymap.set('n', '<leader>pc', ':PeekClose', { silent = true })
  end,
}
