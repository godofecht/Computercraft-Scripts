function depositAllItems()
  for i = 16,1,-1 do
    turtle.select(i)
    turtle.drop()
  end
end
 
local tArgs = {...}
if #tArgs ~= 2 then
  print("Requires length, width")
  return
end
 
local x = tonumber(tArgs[1]) - 1
local y = tonumber(tArgs[2])
local z = 1
 
 
 
function returnToStart()
  if y % 2 == 0 then
    turtle.turnRight()
    for i = 1, y-1 do
  
     bfwd = turtle.forward()
     if bfwd == false then
       turtle.dig()
       turtle.forward()
     end
    end
    depositAllItems()
    turtle.turnRight()
  else
    turtle.turnLeft()
    for i = 1, y-1 do
      bfwd = turtle.forward()
      if bfwd == false then
        turtle.dig()
        turtle.forward()
      end
    end
    turtle.turnLeft()
    for i = 1, x do
      turtle.forward()
    end
    turtle.turnRight()
    
    depositAllItems()
    turtle.turnRight()
  end
end
 
 
 
 
if x == nil or y == nil or z == nil then
  print("Invalid dimensions")
  return
end
 
if x < 0 or y < 0 or z < 0 then
  print("Invalid (negative) dimensions")
  return
end
 
local fuel = turtle.getFuelLevel()
local roomSize = x * y * z
while fuel < roomSize do
  if not turtle.refuel(1) then
    print("Not enough fuel")
    return
  end
end
 
local direction = true
 
for j = 1, y do
  for k = 1, x do
    turtle.dig()
    turtle.forward()
  end
  if j < y then
    if direction then
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
      direction = false
    else
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
      direction = true
    end
  end
end
 
 
returnToStart()