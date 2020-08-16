Red [Needs: 'view]

view [
  title "IP info"
  below 
  lip: text-list 400x300 font-name system/view/fonts/fixed font-size 8 data []
  do [
    p: load http://gd.geobytes.com/GetCityDetails
    foreach k keys-of p [
      append lip/data rejoin [pad k 30 select p k]
    ]
  ]
]