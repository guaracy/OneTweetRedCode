Red [needs: 'view]
t: 0
view [ 
  title "Timer"
  backdrop white
  below
  c: h1 bold 180 rate 1 
  on-time [
    c/text: form now/time
    c/color: if all[t > 0 c/data > t][red][white]
  ]
  f: field hint "Secs"
  button "Start" [c/color: white t: now/time + to-integer f/text]
]