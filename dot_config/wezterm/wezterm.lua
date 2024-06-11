local config = {}

local appearance = require("appearance")
appearance.apply(config)

local binds = require("binds")
binds.apply(config)

local remote = require("remote")
remote.apply(config)

require("helpers").load_overrides(config)

return config
