# Computercraft-Scripts

Lua scripts for the ComputerCraft Minecraft mod.

## What this is

ComputerCraft is a Minecraft mod that adds programmable computers and turtles (small robots that move, dig and place blocks). You program them in Lua, a short scripting language. This repo holds four Lua programs. Three of them drive a turtle: one digs out a room, one harvests a field, and one works over a farm plot. The fourth scrolls a line of news headlines across a monitor block.

## What you can learn from it

Computer Science:

- Nested loops that cover a grid, one row at a time.
- A back-and-forth (serpentine) path, where a true/false flag decides whether the turtle turns left or right at the end of each row.
- Reading command-line arguments and rejecting bad input before doing anything.
- Calling a library of functions (the `turtle` API) to control a machine.
- Building a scrolling display by taking a moving window over a long string.

## Run it

### In Minecraft

**You will need:**

- Minecraft Java Edition with a ComputerCraft mod installed. [CC: Tweaked](https://tweaked.cc/) is the maintained version of ComputerCraft.
- A turtle with a tool equipped (a mining turtle has a pickaxe) for `digroom.lua`, `farm.lua` and `till.lua`.
- An advanced monitor placed next to a computer for `news_text.lua`.

The scripts have not been tested for this guide in a particular Minecraft or mod version.

1. Get a script onto the turtle or computer. With CC: Tweaked's `wget` program, right-click the turtle and type:

   ```text
   wget https://raw.githubusercontent.com/godofecht/Computercraft-Scripts/main/farm.lua farm
   ```

   You can also type `edit farm`, paste the code in, and save.

2. Give the turtle fuel before you start. Put coal in its inventory and run the built-in `refuel` program:

   ```text
   refuel all
   ```

   The scripts check fuel at the start, but the check has a bug (see Project status). A turtle that starts with enough fuel avoids it.

3. Stand the turtle in the corner of the area, facing along the first row. The area runs forward and to the right of the turtle.

4. Run the script with the size of the area:

   | Script | Command | Arguments |
   |---|---|---|
   | `digroom.lua` | `digroom 5 4 3` | length, width, height |
   | `farm.lua` | `farm 9 9` | length, width |
   | `till.lua` | `till 9 9` | length, width |
   | `news_text.lua` | `news_text` | none |

   Run with the wrong number of arguments and the script prints what it needs, for example `Requires length, width`.

5. `news_text.lua` runs forever. Hold Ctrl+T to stop it.

## How it works

Each turtle script works the same way. It reads the size of the area, checks the numbers, and checks fuel. Then it moves along a row, digging the block in front at each step. At the end of the row it turns into the next row and comes back the other way. The `direction` variable flips between true and false so it knows which way to turn next. At the end it drives back toward where it started.

| File | What is in it |
|---|---|
| `digroom.lua` | Digs a room of length by width by height. After each layer it digs up, moves up and turns round. |
| `farm.lua` | Digs along each row of a field to harvest it, drives back, then drops every item it carries. Place a chest where it ends up. |
| `till.lua` | At each square, checks the block below. If there is no block there, it digs down and places an item from its inventory, moving to the next slot when one runs out. |
| `news_text.lua` | Finds a monitor, then scrolls five example headlines across it in purple, such as "Market day is on Saturday". `scrollText(text, 1)` sets the speed to one character a second. |

## Ideas to try

1. Write your own headlines. Change the `text[1]` to `text[5]` lines at the bottom of `news_text.lua`, and change the speed in `scrollText(text, 1)`.
2. Fix the fuel check in `digroom.lua`. The loop compares against `fuel`, which never changes. Read `turtle.getFuelLevel()` again inside the loop.
3. Make `farm.lua` replant. After each `turtle.dig()`, select a slot with seeds and call `turtle.placeDown()` or `turtle.place()`. Try it on a small field first.
4. Give `digroom.lua` a way home when its inventory fills. Check `turtle.getItemCount(16)` and stop when the last slot has something in it.
5. Make the fuel estimate honest. In each turtle script, `roomSize` counts the blocks in the area. Add the moves for changing rows and the trip back.

## Technical details

The scripts use the `turtle` API (`dig`, `digUp`, `digDown`, `forward`, `up`, `down`, `turnLeft`, `turnRight`, `detectDown`, `placeDown`, `select`, `drop`, `getItemCount`, `getFuelLevel`, `refuel`) and the `peripheral` API (`peripheral.find("monitor")`, then `setTextColor`, `getSize`, `getCursorPos`, `setCursorPos`, `clearLine` and `write` on the monitor).

The first argument (length) is reduced by one before use, because the block the turtle stands in counts as the first block of each row.

## Project status

These are small scripts written for play. Known problems, found by reading the code:

- The fuel check in `digroom.lua`, `farm.lua` and `till.lua` reads the fuel level once. If the turtle starts with less than it needs, the loop burns every fuel item it can, then prints `Not enough fuel` and stops, even when it now has plenty.
- `digroom.lua` has no check for a full inventory. The old README said it returns when the inventory is full. The code does not do this.
- `farm.lua` harvests but does not replant. The old README said it replants.
- `till.lua` moves to the next inventory slot when one is empty, with no upper limit. When all 16 slots are empty it will fail with an error.
- `news_text.lua` stops with an error if no monitor is attached.

## Licence

You can use, copy and change this code for any purpose, as long as you keep the copyright notice. See [LICENSE](LICENSE) (MIT).

## Credits

Written by Abhishek Shivakumar. Built for ComputerCraft, created by Daniel Ratcliffe, and its maintained version [CC: Tweaked](https://tweaked.cc/).
