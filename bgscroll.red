Red [Needs: 'View]
png: load %./desert.png
x: 0
view [
 title "Background scroller"
 canvas: base 200x200 rate 30
 on-time [
  p1: as-pair x 0
  canvas/draw: reduce[
   'image png 0x0 'crop p1 300x200
  ]
  x: x + 1
  if x > 400 [x: 1]
 ]
]