_addon.name = 'Assist'
_addon.author = 'DiscipleOfEris'
_addon.version = '1.0.0'
_addon.command = 'assist'

require('tables')
require('strings')
packets = require('packets')
texts = require('texts')
require('lock_target_packet')

delock = false

PACKET_LOCK_TARGET = 0x058

windower.register_event('addon command', function(command, ...)
  args = L{...}
  if command == 'target' then
    local target_id = tonumber(args[1])
    assist(target_id)
  elseif command == 'me' then
    local target = windower.ffxi.get_mob_by_target('t')
    windower.send_ipc_message('target '..target.id)
  end
end)

windower.register_event('ipc message', function(message)
  args = message:split(' ')
  if args[1] == 'target' then
    local target_id = tonumber(args[2])
    assist(target_id)
  end
end)

windower.register_event('prerender', function()
  local target = windower.ffxi.get_mob_by_target('t')
  
  if target and target.id == delock then
    windower.send_command('@input /lockon')
    delock = false
  end
end)

function assist(target_id)
  local self = windower.ffxi.get_mob_by_target('me')
  local target = windower.ffxi.get_mob_by_id(target_id)
  local current = windower.ffxi.get_mob_by_target('t')
  if current and target.id == current.id then return end
  
  if target.spawn_type == 16 then delock = target_id end
  
  packet = packets.new('incoming', PACKET_LOCK_TARGET, {
    ['Assist Id'] = self.id,
    ['Assist Index'] = self.index,
    ['Target Id'] = target.id,
    ['Target Index'] = target.index,
  })
  
  packets.inject(packet)
end
