#applied usage of an array

type 
  Direction = enum
    north, east, south, west
  BlinkLights = enum
    off, on,slowBlink, mediumBlink, fastBlink
  LevelSetting = array[north..west,BlinkLights]
var
  level: LevelSetting

level[north]=on
level[south]=slowBlink
level[east]=fastBlink

echo repr(level)
echo low(level)
echo len(level)
echo high(level)

for item in low(level)..high(level):
  echo item,":",level[item]