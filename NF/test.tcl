source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl
package require Tk

set width 600 ;# in pixels
set height 450 ;# in pixels
wm geometry . ${width}x$height

frame .f -bg black
frame .f.f2 -bg white

canvas .f.f2.canv_gameMini -bg red -height 150 -width 150 
canvas .f.canv_gameMap -bg blue -height 450 -width 450 

pack .f.f2.canv_gameMini -side top -fill both
pack .f.canv_gameMap -side right -fill both -expand 1

pack .f -fill both -expand 1 -side top
pack .f.f2 -side top

pack [label .f.f2.lab1 -text "Boite à outils" -bg green] -side top
pack [label .f.f2.lab2 -text "==============" -bg green] -side top
pack [label .f.f2.lab3 -text " Vaisseau " -bg green] -side top
pack [label .f.f2.lab4 -text " planette " -bg green] -side top
pack [label .f.f2.labNo -text "  " -bg green ] -side top 
pack [label .f.f2.lab5 -text " ANNULER " -bg green ] -side top 

pack [label .f.canv_gameMap.t -text "Dans l'univers" -bg green]  -side bottom

Jeu jeu .f.f2.canv_gameMini .f.canv_gameMap

Univers univ jeu
UniversMap univMap .f.f2.canv_gameMini univ
UniversMiniMap univMiniMap .f.canv_gameMap univ

# events Listeners

bind .f.canv_gameMap <Double-1>  " singleclick %x %y;"

 proc singleclick {x y} {
     puts "new planet"
     jeu addPlanete $x $y 15
     return
 }

#jeu addPlanete 30 30 15
#jeu addPlanete 40 40 15
#jeu addPlanete 60 60 25

Introspact i
i attach jeu

