local error = require('user/msg').error
local status_ok, tt = pcall(require, 'toggleterm')
if not status_ok then
  error('Toggleterm', 'Toggleterm ran into a problem')
  return
end

tt.setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return 12
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  hide_numbers = true,
  start_in_insert = true,
  persist_mode = false,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
}
