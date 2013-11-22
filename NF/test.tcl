source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl
package require Tk

frame .f -bg black
frame .f.f2 -bg white

canvas .f.f2.canv_gameMini -bg red -height 150 -width 150 
canvas .f.c2 -bg blue -height 500 -width 500 

pack .f.f2.canv_gameMini -side top -fill both
pack .f.canv_gameMap -side right -fill both -expand 1

pack .f -fill both -expand 1 -side top
pack .f.f2 -side top

pack [label .f.f2.lab1 -text "Boite à outils" -bg green] -side top
pack [label .f.f2.lab2 -text "==============" -bg green] -side top
pack [label .f.f2.lab3 -text " Vaisseau " -bg green] -side top
pack [label .f.f2.lab4 -text " planette " -bg green] -side top
pack [label .f.f2.lab5 -text "  " -bg green ] -side top 
pack [label .f.canv_gameMap.t -text "Dans l'univers" -bg green]  -side bottom

Jeu jeu .f.f2.canv_gameMini .f.canv_gameMap

Univers univ jeu
UniversMap univMap .canv_gameMini univ
UniversMiniMap univMiniMap .canv_gameMap univ

jeu addPlanete
jeu addPlanete
jeu addPlanete

Introspact i
i attach jeu
