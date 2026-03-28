
local f=CreateFrame("Frame","TM_UI",UIParent)
f:SetSize(540,440)
f:SetPoint("CENTER")
f:Hide()

local panels={}

local function CreateTab(name,i)
 local b=CreateFrame("Button",nil,f,"OptionsFrameTabButtonTemplate")
 b:SetID(i)
 b:SetText(name)
 b:SetPoint("TOPLEFT",(i-1)*110,0)
 PanelTemplates_TabResize(b,0)

 local p=CreateFrame("Frame",nil,f)
 p:SetAllPoints()
 p:Hide()
 panels[i]=p

 b:SetScript("OnClick",function()
  for _,v in pairs(panels) do v:Hide() end
  p:Show()
 end)

 return p
end

local p1=CreateTab("Buttons",1)
local p2=CreateTab("Buffs",2)
local p3=CreateTab("Filters",3)
local p4=CreateTab("Modules",4)

-- Buttons sliders
local s=CreateFrame("Slider",nil,p1,"OptionsSliderTemplate")
s:SetPoint("TOPLEFT",20,-40)
s:SetMinMaxValues(16,40)
s:SetValue(TM_Config.Get("btn_size",24))
s:SetScript("OnValueChanged",function(_,v) TM_Config.Set("btn_size",v) end)

-- Buffs controls
local d=CreateFrame("Button",nil,p2,"UIPanelButtonTemplate")
d:SetPoint("TOPLEFT",20,-40)
d:SetText("Toggle Direction")
d:SetScript("OnClick",function()
 local cur=TM_Config.Get("buff_dir","LEFT")
 TM_Config.Set("buff_dir", cur=="LEFT" and "RIGHT" or "LEFT")
end)

-- Filters
local function BuildFilters()
 local y=-40
 for name,_ in pairs(TM_Buttons) do
  local btn=CreateFrame("Button",nil,p3,"UIPanelButtonTemplate")
  btn:SetPoint("TOPLEFT",20,y)
  btn:SetSize(220,20)
  btn:SetText(name)
  btn:SetScript("OnClick",function() TM_Config.ToggleFilter(name) end)
  y=y-25
 end
end
f:SetScript("OnShow",BuildFilters)

-- Modules toggle
local m1=CreateFrame("Button",nil,p4,"UIPanelButtonTemplate")
m1:SetPoint("TOPLEFT",20,-40)
m1:SetText("Toggle Buttons Module")
m1:SetScript("OnClick",function() TM_Config.ToggleModule("buttons") end)

local m2=CreateFrame("Button",nil,p4,"UIPanelButtonTemplate")
m2:SetPoint("TOPLEFT",20,-80)
m2:SetText("Toggle Buffs Module")
m2:SetScript("OnClick",function() TM_Config.ToggleModule("buffs") end)

panels[1]:Show()

SLASH_TMUI1="/tmui"
SlashCmdList["TMUI"]=function() f:SetShown(not f:IsShown()) end
