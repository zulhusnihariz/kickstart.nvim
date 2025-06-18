local M = {}

function M.setup()
  vim.keymap.set('n', '<F1>', '<nop>')
  vim.keymap.set('i', '<F1>', '<nop>')
  vim.keymap.set('v', '<F1>', '<nop>')

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

  vim.keymap.set('n', '<C-u>', '<C-u>zz')
  vim.keymap.set('n', '<C-d>', '<C-d>zz')

  vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

  vim.keymap.set('n', '<leader>P', '"+p')
  vim.keymap.set('n', '<leader>Y', '"+y', { noremap = true })

  vim.keymap.set('x', '<leader>p', [["_dP]])

  -- vim.keymap.set('n', '<Tab>', '<CMD>cnext<CR>', { noremap = true, silent = true })
  -- vim.keymap.set('n', '<S-Tab>', '<CMD>cprev<CR>', { noremap = true, silent = true })

  -- -dv to not focus on trerminal on open
  vim.keymap.set('n', '<leader>st', '<CMD>!tmux split-window -dv -l 15<CR>', { silent = true })
  vim.keymap.set('n', '<leader>ms', '<CMD>Telescope tmux sessions<CR>', { silent = true })

  vim.keymap.set('n', 'gh', function()
    local blink = require 'blink-cmp'
    if blink.is_visible() then
      blink.hide()
    else
      blink.show {
        callback = function()
          blink.show_documentation()
        end,
      }

      vim.keymap.set('n', '<Esc>', function()
        blink.hide()
      end, { noremap = true, silent = true })
    end
  end, { silent = true })
end

return M
