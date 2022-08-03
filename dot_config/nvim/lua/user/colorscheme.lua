-- Available themes: calvera, tokyodark, moonlight, moonfly, neon
local theme = 'neon'

-- Uncomment of using theme neon
-- Available styles: default, doom, dark, light
local neon_style = 'dark'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. theme)
if not status_ok then
  vim.notify('Colorscheme ' .. theme .. ' could not be found!')
  return
end


local neon_status_ok, _ = pcall(vim.cmd, 'colorscheme neon')
if neon_status_ok then
  vim.g.neon_style = neon_style
  vim.g.neon_italic_comment = true
end

local moon_status_ok, _ = pcall(vim.cmd, 'colorscheme moonlight')
if moon_status_ok then
  vim.g.moonlight_italic_comments = true
end

local tokyodark_status_ok, _ = pcall(vim.cmd, 'colorscheme tokyodark')
if tokyodark_status_ok then
  vim.g.tokyodark_enable_italic_comment = true
end

local calvera_status_ok, _ = pcall(vim.cmd, 'colorscheme calvera')
if calvera_status_ok then
  vim.g.calvera_italic_comments = true
end

vim.cmd('colorscheme ' .. theme)
