
local f=CreateFrame("Frame")
local t={}
f:SetScript("OnUpdate",function(_,e)
 for i=#t,1,-1 do
  local v=t[i]; v.e=v.e+e
  if v.e>=v.d then pcall(v.f)
   if v.o then table.remove(t,i) else v.e=0 end
  end
 end
end)
TM_Timer={}
function TM_Timer.After(d,f) table.insert(t,{d=d,e=0,f=f,o=true}) end
function TM_Timer.Ticker(d,f) table.insert(t,{d=d,e=0,f=f}) end
