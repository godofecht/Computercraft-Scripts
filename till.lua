


local itemslot = 1

local tArgs = {...}
if #tArgs ~= 2 then
  print("Requires length, width")
  return
end

local x = tonumber(tArgs[1]) - 1
local y = tonumber(tArgs[2])
local z = 1

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
for i = 1, z do
  for j = 1, y do
    for k = 1, x do
      if turtle.getItemCount(itemslot) == 0 then
        itemslot = itemslot+1
      end
      turtle.select(itemslot)
        if turtle.detectDown() == false then
          turtle.digDown()
          turtle.placeDown()
        end
        turtle.forward()
    end
    if j < y then
      if direction then
        turtle.turnRight()
        if turtle.detectDown() == false then
          turtle.digDown()
          turtle.placeDown()
        end
        turtle.forward()
        turtle.turnRight()
        direction = false
      else
        turtle.turnLeft()
        if turtle.detectDown() == false then
          turtle.digDown()
          turtle.placeDown()
        end
        turtle.forward()
        turtle.turnLeft()
        direction = true
      end
    end
  end
  if i < z then
    turtle.digUp()
    turtle.up()
    turtle.turnRight()
    turtle.turnRight() 
  end
end

if y % 2 == 0 then
  turtle.turnRight()
  for i = 1, y-1 do
    turtle.forward()
  end
  turtle.turnRight()
else
  turtle.turnLeft()
  for i = 1, y-1 do
      turtle.forward()
    end
    turtle.turnLeft()
    for i = 1, x do
      turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
end


--repositioning because turtle ends up in wrong pos
--turtle.up()
--turtle.turnRight()
--turtle.forward()
--turtle.turnLeft()