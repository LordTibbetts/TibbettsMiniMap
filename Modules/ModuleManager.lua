
TM_Modules={}
function TM_RegisterModule(n,f) TM_Modules[n]=f end
function TM_LoadModules()
 for n,f in pairs(TM_Modules) do
  if TM_Config.IsModuleEnabled(n) then pcall(f) end
 end
end
TM_Timer.After(0.1,TM_LoadModules)
