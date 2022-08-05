local error = require('user/msg').error
local status_ok, color = pcall(require, 'colorizer')
if not status_ok then
  error('Colorizer', 'Colorizer ran into an issue')
end

color.setup()
