local error = require('user/msg').error
local status_ok, shade = pcall(require, 'shade')
if not status_ok then
  error('Shade', 'Shade ran into an issue')
  return
end

shade.setup({
  overlay_opacity = 50,
  opacity_step = 1,
})
