Red [Needs: 'View]
view[
 lp: text-list 150x300
 on-change [pg/text: read to-file lp/data/(lp/selected)]
 pg: area 400x300 font-name system/view/fonts/fixed
 do [lp/data: collect [foreach f read %. [if ".red" = suffix? f [keep to-string f]]]]
 return
 button "Run" [do pg/text]
]