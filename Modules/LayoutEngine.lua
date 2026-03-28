
TM_Layout={}
function TM_Layout.Snap(frame)
 local mm=Minimap
 local x=frame:GetLeft()
 local mx=mm:GetLeft()
 if abs(x-mx)<50 then frame:SetPoint("RIGHT",mm,"LEFT",-5,0)
 elseif abs(x-(mx+140))<50 then frame:SetPoint("LEFT",mm,"RIGHT",5,0)
 end
end
