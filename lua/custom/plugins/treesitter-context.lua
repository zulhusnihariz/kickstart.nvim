return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = function()
      require 'treesitter-context'
    end,
  },
}
