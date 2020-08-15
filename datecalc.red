Red [needs: 'view]

view[
  title "Date calculator"
  a: calendar 
  b: calendar 
  return
  f: field 100
  button "Add" [b/data: now/date + to-integer f/text show b]
  button "Diff" [f/text: rejoin [(any [b/data now/date]) - any [a/data now/date] " days"]]
]
