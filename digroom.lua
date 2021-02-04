local tArgs = {...}
if #tArgs ~= 3 then
  print("Requires length, width, height")
  return
end
 
local x = tonumber(tArgs[1]) - 1
local y = tonumber(tArgs[2])
local z = tonumber(tArgs[3])
 
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
  if i < z then
    turtle.digUp()
    turtle.up()
    turtle.turnRight()
    turtle.turnRight() 
  end
end
 
if y % 2 == 0 then
  turtle.turnRight()
  for i = 1, y do
    turtle.forward()
  end
  turtle.turnRight()
else
  turtle.turnLeft()
  for i = 1, y do
    turtle.forward()
  end
  turtle.turnLeft()
  for i = 1, x do
    turtle.forward()
  end
  turtle.turnRight()
  turtle.turnRight()
end
for i = 1, z do
  turtle.down()
end