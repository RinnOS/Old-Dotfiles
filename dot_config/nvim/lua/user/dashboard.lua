local error = require('user/msg').error
local status_ok, db = pcall(require, 'dashboard')
if not status_ok then
  error('Dashboard', 'Dashboard got an error')
  return
end

local home = os.getenv('HOME')

-- db.preview_file_path = home .. '/.config/nvim/static/picture'
-- db.preview_file_height = 12
-- db.preview_file_width = 80
db.custom_center = {
  { icon = ' ',
  desc = 'Recently latest session                  ',
  shortcut = 'SPC s l',
  action = 'SessionLoad'},
}
