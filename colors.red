Red [needs: 'view]
w: words-of system/words
t: collect [
  forall w [
    if tuple? get/any w/1 [keep to-string w/1]
  ]
]
view [
  title "Red colors"
  l: text-list data t
  on-change [b/color: do to-word l/data/(l/selected)]
 b: base 100x100 transparent
]