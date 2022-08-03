local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return
end

local M = {}

M.error = function(title, msg)
  notify(msg, 'error', { title = title })
end

M.warn = function(title, msg)
  notify(msg, vim.log.levels.WARN, { title = title})
end

M.info = function(title, msg)
  notify(msg, 'info', { title = title })
end

return M
