return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup {
      app = '/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe',
    }

    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

    vim.keymap.set('n', '<leader>po', ':PeekOpen<cr>', { silent = true })
    vim.keymap.set('n', '<leader>pc', ':PeekClose<cr>', { silent = true })
  end,
}
