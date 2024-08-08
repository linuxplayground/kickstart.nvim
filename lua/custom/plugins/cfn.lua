vim.api.nvim_create_autocmd({
  'BufNewFile',
  'BufRead',
}, {
  pattern = '*.yaml,*.yml',
  callback = function(_, buf)
    if vim.fn.search 'AWSTemplateFormatVersion' ~= 0 then
      vim.api.nvim_set_option_value('filetype', 'yaml.cloudformation', { buf = buf })
    end
  end,
})

require('lspconfig.configs').cfn_lsp = {
  default_config = {
    cmd = { os.getenv 'HOME' .. '/.local/bin/cfn-lsp-extra' },
    filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
    root_dir = function(fname)
      return require('lspconfig').util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {
      documentFormatting = false,
    },
  },
}
require('lspconfig').cfn_lsp.setup {}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

return {
  'mfussenegger/nvim-lint',
  config = function(_)
    require('lint').linters_by_ft = {
      cloudformation = { 'cfn_lint', 'cfn_nag' },
    }
  end,
}
