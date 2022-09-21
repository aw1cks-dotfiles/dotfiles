local wilder = require('wilder')

wilder.setup({
  modes = {
    ':',
    '/',
    '?',
  },
})

local renderer_common = {
  pumblend = 30,
}

local renderer_search = {}
for k, v in pairs(renderer_common) do renderer_search[k] = v end
for k, v in pairs(wilder.wildmenu_airline_theme()) do renderer_search[k] = v end

local renderer_wild = {
  highlighter = wilder.lua_fzy_highlighter(),
  highlights  = {
    accent = wilder.make_hl(
      'WilderAccent', 'Pmenu',
      {
        {a = 1}, {a = 1},
        {foreground = '#f4468f'}
      }
    ),
  },
  left =  {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}
for k, v in pairs(renderer_common) do renderer_wild[k] = v end


wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer(renderer_wild),
  ['/'] = wilder.wildmenu_renderer(renderer_search),
}))
