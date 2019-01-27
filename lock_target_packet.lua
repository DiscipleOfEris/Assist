packets = require('packets')
require('tables')

PACKET_LOCK_TARGET = 0x058

local function id(val)
    local mob = windower.ffxi.get_mob_by_id(val)
    return mob and mob.name or '-'
end

local function index(val)
    local mob = windower.ffxi.get_mob_by_index(val)
    return mob and mob.name or '-'
end

packets.raw_fields.incoming[PACKET_LOCK_TARGET] = L{
  {ctype='unsigned int',      label='Assist Id',    fn=id},       -- 04
  {ctype='unsigned int',    label='Target Id',    fn=id},         -- 0C
  {ctype='unsigned short',    label='Assist Index', fn=index},    -- 08
  {ctype='unsigned short',      label='Target Index', fn=index},  -- 10
}