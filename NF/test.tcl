source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl


canvas .canv_gameMini
canvas .canv_gameMap
pack .canv_gameMini -expand 1 -fill both
pack .canv_gameMap -expand 1 -fill both
Jeu jeu .canv_gameMini .canv_gameMap

Univers univ jeu
UniversMap univMap .canv_gameMini univ
UniversMiniMap univMiniMap .canv_gameMap univ

jeu addPlanete
jeu addPlanete
jeu addPlanete

Introspact i
i attach jeu