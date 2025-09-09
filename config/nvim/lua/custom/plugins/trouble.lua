return {
  'folke/trouble.nvim',
  opts = {
    focus = true,
    modes = {
      test = {
        mode = 'diagnostics',
        preview = {
          type = 'split',
          relative = 'win',
          position = 'right',
          size = 0.3,
        },
      },
    },
  },
  cmd = 'Trouble',
  keys = {
    { '<leader>q', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
  },
}
