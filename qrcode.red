Red [Needs: 'view]
view [
  title "QR-Code"
  below 
  a: area 300x300 font-name system/view/fonts/fixed
  s: field 300
  button "QR-code" [
    p: read rejoin [http://qrenco.de/ s/text]
    parse p [remove thru "pre>" to "</pre" remove to end]
    a/text: p
  ]
]