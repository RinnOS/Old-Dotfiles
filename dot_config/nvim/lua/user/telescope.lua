local error = require('user/msg').error
local status_ok, ts = pcall(require, 'telescope')
if not status_ok then
  error('Telescope', 'Telescope ran into an issue')
  return
end

ts.setup{

}
