
TM_DB = TM_DB or { profile="default", profiles={} }

local function P()
  local n = TM_DB.profile
  TM_DB.profiles[n] = TM_DB.profiles[n] or {
    settings = {},
    filters = {},
    modules = {buttons=true,buffs=true}
  }
  return TM_DB.profiles[n]
end

TM_Config = {}

function TM_Config.Get(k,d)
  local s=P().settings
  if s[k]==nil then s[k]=d end
  return s[k]
end

function TM_Config.Set(k,v) P().settings[k]=v end

function TM_Config.ToggleFilter(n)
  local f=P().filters
  f[n]=not f[n]
end

function TM_Config.IsFiltered(n)
  return P().filters[n]
end

function TM_Config.ToggleModule(n)
  local m=P().modules
  m[n]=not m[n]
end

function TM_Config.IsModuleEnabled(n)
  return P().modules[n]
end
