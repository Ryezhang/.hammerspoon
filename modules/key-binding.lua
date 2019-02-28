local wm = require('modules/window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"ctrl", "alt"}, {
  left = wm.throwLeft,
  right = wm.throwRight,
  j = wm.throwLeft,
  l = wm.throwRight
})

-- * Set Window Position on screen
windowBind({"ctrl", "alt", "cmd"}, {
  m = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf,     -- ⌃⌥⌘ + ↓
  j = wm.leftHalf,          -- ⌃⌥⌘ + j
  l = wm.rightHalf,         -- ⌃⌥⌘ + l
  i = wm.topHalf,           -- ⌃⌥⌘ + i
  k = wm.bottomHalf         -- ⌃⌥⌘ + k
})
-- * Set Window Position on screen
windowBind({"ctrl", "alt", "shift"}, {
  left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
  right = wm.rightToRight,    -- ⌃⌥⇧ + →
  up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
  down = wm.bottomDown,       -- ⌃⌥⇧ + ↓
  j = wm.rightToLeft,         -- ⌃⌥⇧ + j
  l = wm.rightToRight,        -- ⌃⌥⇧ + l
  i = wm.bottomUp,            -- ⌃⌥⇧ + i
  k = wm.bottomDown           -- ⌃⌥⇧ + k
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
  left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
  right = wm.leftToRight,    -- ⌥⌘⇧ + →
  up = wm.topUp,             -- ⌥⌘⇧ + ↑
  down = wm.topDown,         -- ⌥⌘⇧ + ↓
  j = wm.leftToLeft,         -- ⌥⌘⇧ + j
  l = wm.leftToRight,        -- ⌥⌘⇧ + l
  i = wm.topUp,              -- ⌥⌘⇧ + i
  k = wm.topDown             -- ⌥⌘⇧ + k
})

-- * Windows-like cycle
windowBind({"ctrl", "alt", "cmd"}, {
  u = wm.cycleLeft,          -- ⌃⌥⌘ + u
  y = wm.cycleRight          -- ⌃⌥⌘ + y
})
