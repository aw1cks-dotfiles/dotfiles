return function(args)
  local f = io.open(vim.fn.stdpath('data') .. args.key, 'r')
  if f then
    f:close()
  else
    args.func()
  end
end
