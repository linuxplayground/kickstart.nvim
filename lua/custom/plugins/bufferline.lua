vim.opt.termguicolors = true

return {
  {
    'akinsho/bufferline.nvim',
    --version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
      vim.keymap.set('n', '<leader>x', ':bd<CR>', { silent = true })
      vim.keymap.set('n', '<tab>', ':BufferLineCycleNext<CR>', { silent = true })
    end,
  },
}
