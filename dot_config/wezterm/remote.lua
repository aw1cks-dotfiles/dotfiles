local M = {}

function M.apply(config)
  config.ssh_backend = "LibSsh"
end

return M
