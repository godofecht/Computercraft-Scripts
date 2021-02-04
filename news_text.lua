
 
 
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
 
text = {}
text[1] = "BREAKING NEWS"
text[2] = "Covid-19 killed 10,000 people today"
text[3] = "Scientists have developed anti-matter bombs"
text[4] = "We'll be on the moon in days, says lead scientist Dr. Terace"
text[5] = "Casino opening on the strip soon"
 
scrollText(text,1)