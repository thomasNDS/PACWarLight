package require Tk
package require Img

source utils.tcl
source  ../NF/gml_Object.tcl
source ../NF/PAC.tcl
source ../NF/introspact.tcl
source ../NF/SWL_FC.tcl
source ../NF/utils.tcl

source jeu.tcl
source univers.tcl
source universMap.tcl
source universMiniMap.tcl

set width 1000 ;# in pixels
set height 750 ;# in pixels
wm geometry . ${width}x$height

frame .f
frame .f.f2

canvas .f.f2.canv_gameMini -bg black -height 250 -width 250 
canvas .f.canv_gameMap -bg black -height 600 -width 600 
pack .f.f2.canv_gameMini -side top -fill both
pack .f.canv_gameMap -side right -fill both -expand 1

pack .f -fill both -expand 1 -side top
pack .f.f2 -side top

Jeu jeu .f.f2.canv_gameMini .f.canv_gameMap

Univers univ jeu
UniversMap univMap .f.f2.canv_gameMini univ
UniversMiniMap univMiniMap .f.canv_gameMap univ
  
jeu addJoueur "j1" "blue"
jeu addJoueur "j2" "red"

# events Listeners
bind .f.canv_gameMap <Double-1>  " singleclick %x %y;"

Introspact i
i attach jeu

#Images
set background_file ../fond.jpg
set background [image create photo -file $background_file]
.f.f2.canv_gameMini create image 0 0 -anchor nw -image $background
.f.canv_gameMap create image 0 0 -anchor nw -image $background


proc singleclick {x y} {
    set selectElem [jeu getElementSelected]
    if {$selectElem == "planet"} {
      jeu addPlanete $x $y 30 20
    } elseif {$selectElem == "ship"} {
      addVaisseau $x $y
    }
    return
 }
 
proc addVaisseau {x y} {
    puts "new vaisseau"
    set nomColor [jeu getSelectedPlayer]
    set nom [lindex $nomColor 0]
    set color [lindex $nomColor 1]
    jeu addVaisseau $nom $x $y 10 $color
    return
}


