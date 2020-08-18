Red [Needs: 'View]
png: load %./bahamut.png
s: 96x96
y: 192
p: as-pair 0 y
l: 96 * 3 - 1
view [
 title "spritesheet"
 canvas: base 96x96 transparent rate 5
 on-time [
  either p/x > l [p: as-pair 0 y][p: p + 96x0]
  canvas/draw: reduce['image png 0x0 'crop p s]
 ]
]