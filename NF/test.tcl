source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl


canvas .canv_game
Jeu j .canv_game

Univers univ j
UniversMap univMap .canv_game univ
UniversMiniMap univMiniMap .canv_game univ

Introspact i
i attach j