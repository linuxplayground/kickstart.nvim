-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- vim.cmd [[ autocmd BufEnter * silent! lcd %:p:h ]]
-- vim.cmd 'set spell syntax=off'
vim.api.nvim_create_autocmd({
  'BufNewFile',
  'BufRead',
}, {
  pattern = '*.yaml,*.yml',
  callback = function(ev)
    if vim.fn.search 'AWSTemplateFormatVersion' ~= 0 then
      vim.api.nvim_set_option_value('filetype', 'yaml.cloudformation', { buf = ev.buf })
    end
  end,
})

vim.lsp.config('cfn-lsp-extra', {
  cmd = { os.getenv 'HOME' .. '/.local/bin/cfn-lsp-extra' },
  filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
  root_markers = { '.git' },
  settings = {
    documentFormatting = false,
  },
})
vim.lsp.enable 'cfn-lsp-extra'
return {
  { 'mason-org/mason.nvim', version = '^1.0.0' },
  { 'mason-org/mason-lspconfig.nvim', version = '^1.0.0' },
}
