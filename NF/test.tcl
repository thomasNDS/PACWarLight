source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl


canvas .canv_game
pack .canv_game -expand 1 -fill both
Jeu jeu .canv_game

Univers univ jeu
UniversMap univMap .canv_game univ
UniversMiniMap univMiniMap .canv_game univ

jeu addTruc
jeu addTruc
jeu addTruc

Introspact i
i attach jeu