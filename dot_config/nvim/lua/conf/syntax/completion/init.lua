-- Ensure we ran COQdeps before starting COQ
if not require('lib').autoupdate({
  func = function()
    require('coq').deps()
  end,
  path = vim.fn.stdpath('data') .. '/coq-updated'
}) then
  vim.g.coq_settings = {
    auto_start = 'shut-up',
  }
end
