source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl
package require Tk

set width 800 ;# in pixels
set height 600 ;# in pixels
wm geometry . ${width}x$height

frame .f -bg black
frame .f.f2 -bg white

canvas .f.f2.canv_gameMini -bg red -height 200 -width 200 
canvas .f.canv_gameMap -bg blue -height 600 -width 600 

pack .f.f2.canv_gameMini -side top -fill both
pack .f.canv_gameMap -side right -fill both -expand 1

pack .f -fill both -expand 1 -side top
pack .f.f2 -side top
pack [label .f.canv_gameMap.t -text "Dans l'univers" -bg green]  -side bottom

Jeu jeu .f.f2.canv_gameMini .f.canv_gameMap

Univers univ jeu
UniversMap univMap .f.f2.canv_gameMini univ
UniversMiniMap univMiniMap .f.canv_gameMap univ

ToolKit toolKit jeu .f.f2
  
jeu addJoueur toto bleu
jeu addJoueur titi bleu

# events Listeners
bind .f.canv_gameMap <Double-1>  " singleclick %x %y;"

 proc singleclick {x y} {
     puts "new planet"
     jeu addPlanete $x $y 15
     return
 }
 


#jeu addPlanete 30 30 25

Introspact i
i attach jeu

