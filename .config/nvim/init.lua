require('initialize')
require('settings')
require('plugins')
require('mappings')
require('autocommands')
require('fw/symbols_outline')

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end
