Red [needs: 'view]
w: words-of system/words
t: collect [
  forall w [
    if tuple? get/any w/1 [keep to-string w/1]
  ]
]
view [
  title "Red colors"
  lc: text-list data t
  on-change [b/color: do to-word lc/data/(lc/selected)]
 b: base 100x100 transparent
]