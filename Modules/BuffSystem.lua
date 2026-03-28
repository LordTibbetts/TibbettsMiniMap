
TM_RegisterModule("buffs", function()

 local function Update()
  local size=TM_Config.Get("buff_size",30)
  local perRow=TM_Config.Get("buff_row",8)
  local spacing=TM_Config.Get("buff_spacing",5)
  local dir=TM_Config.Get("buff_dir","LEFT")

  BuffFrame:ClearAllPoints()
  if dir=="LEFT" then
    BuffFrame:SetPoint("TOPRIGHT",Minimap,"TOPLEFT",-spacing,0)
  else
    BuffFrame:SetPoint("TOPLEFT",Minimap,"TOPRIGHT",spacing,0)
  end

  local index=0
  for i=1,40 do
    local b=_G["BuffButton"..i]
    if b then
      index=index+1
      b:SetSize(size,size)
      b:ClearAllPoints()

      local row=math.floor((index-1)/perRow)
      local col=(index-1)%perRow

      local x = col*(size+spacing)
      if dir=="LEFT" then x=-x end

      b:SetPoint("TOPRIGHT",BuffFrame,"TOPRIGHT",x,-row*(size+spacing))
    end
  end
 end

 TM_Timer.Ticker(1,Update)

end)
