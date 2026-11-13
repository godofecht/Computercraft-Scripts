
 
 
mon = peripheral.find("monitor")
mon.setTextColor(colors.purple)
 
 
 
function scrollText(tStrings, nRate)
 
 
nRate = nRate or 5
if nRate < 0 then
  error("rate must be positive")
end
local nSleep = 1 / nRate
 
width, height = mon.getSize()
x, y = mon.getCursorPos()
        sText = ""
        for n = 1, #tStrings do
                sText = sText .. tostring(tStrings[n])
  sText = sText .. " | "
        end
        sString = "| "
        if width / string.len(sText) < 1 then
                nStringRepeat = 3
        else
                nStringRepeat = math.ceil(width / string.len(sText) * 3)
        end
for n = 1, nStringRepeat do
  sString = sString .. sText
end
while true do
  for n = 1, string.len(sText) do
   sDisplay = string.sub(sString, n, n + width - 1)
   mon.clearLine()
   mon.setCursorPos(1, y)
   mon.write(sDisplay)
   sleep(nSleep)
  end
end
end
 
-- Example headlines. These are made up. Replace them with your own text.
text = {}
text[1] = "EXAMPLE NEWS"
text[2] = "Wheat harvest at the north farm is ready"
text[3] = "New railway line opens between spawn and the village"
text[4] = "Mining turtle reaches level 12"
text[5] = "Market day is on Saturday"
 
scrollText(text,1)