return {
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      require('rainbow-delimiters.setup').setup {
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterViolet',
          'RainbowDelimiterBlue',
          --          'RainbowDelimiterRed',
          --          'RainbowDelimiterOrange',
          --          'RainbowDelimiterGreen',
          --          'RainbowDelimiterCyan',
        },
      }
    end,
  },
}
