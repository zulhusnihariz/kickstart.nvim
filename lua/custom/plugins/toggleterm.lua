return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    keys = {
      { '<leader>st', '<cmd>ToggleTerm size=15 direction=horizontal name=desktop<cr>', desc = 'toggle terminal' },
    },
  },
}
