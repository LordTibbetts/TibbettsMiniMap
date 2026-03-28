
TM_Buttons={}
local bar

local function Build()
 if not bar then
  bar=CreateFrame("Frame","TM_ButtonBar",UIParent)
  bar:SetPoint("TOPRIGHT",Minimap,"BOTTOMRIGHT",0,-5)
  bar:SetSize(220,220)
 end

 local size=TM_Config.Get("btn_size",24)
 local perRow=TM_Config.Get("btn_row",8)

 local i=0
 for j=1,Minimap:GetNumChildren() do
  local c=select(j,Minimap:GetChildren())
  if c and c:GetObjectType()=="Button" and not c:IsProtected() then
    local name=c:GetName() or ("btn"..j)
    TM_Buttons[name]=c

    if not TM_Config.IsFiltered(name) then
      i=i+1
      c:SetParent(bar)
      c:SetSize(size,size)
      c:ClearAllPoints()
      local r=math.floor((i-1)/perRow)
      local col=(i-1)%perRow
      c:SetPoint("TOPLEFT",col*(size+2),-r*(size+2))
    end
  end
 end
end

TM_RegisterModule("buttons", function()
 TM_Timer.Ticker(2,Build)
end)
