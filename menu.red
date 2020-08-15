Red [Needs: 'View]
view [
 l: text-list 150x300
 on-select [a/text: read to-file l/data/(l/selected)]
 a: area 400x300 bold font-name system/view/fonts/fixed
 do [l/data: collect [foreach f read %. [ if ".red" = suffix? f [keep to-string f]]]]
 return
 button "Run" [do a/text]
]