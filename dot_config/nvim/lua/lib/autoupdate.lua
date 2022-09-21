return function(args)
  -- By default, update every 7 days
  if args.frequency == nil then
    args.frequency = 7
  end

  --[[
    Grab the current epoch.
    We'll read from the file if it exists & compare.
  --]]
  local current_epoch = os.time(os.date('!*t'))
  local last_epoch = nil

  local timestamp_created = false
  local need_update = true
  --[[
    Try and read the timestamp file.
    If it doesn't exist, we'll create it,
    then run our update function that's passed in.
  --]]
  local f = io.open(args.path, 'r')
  if f then
    last_epoch = tonumber(f:read '*all')
    if last_epoch then
      need_update = current_epoch
                    - last_epoch
                    > (86400 * args.frequency)
    end
    f:close()
  else
    timestamp_exists = true
  end

  if need_update then
    local f = io.open(args.path, 'w+')
    f:write(current_epoch)
    f:close()

    args.func()
  end

  return timestamp_created
end
