package require Tk
source utils.tcl
source PAC.tcl
source SWL_FC.tcl

# Vue minimap d'un vaisseau

#PRESENTATION ====================================================

inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control can owner x y radius} {
  this inherited $control
  set radius [expr 0.33 * $radius]
  set x [expr 0.33 * $x]
  set y [expr 0.33 * $y]
  set this(canvas) $can
  set this(vaisseau) [$this(canvas) create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill green ]
}

method VaisseauMiniMap_P update_position { x y } {
	 $this(canvas) move $this(vaisseau) [expr 0.33 * $x ] [expr 0.33 * $y ] 
}

# CONTROLLER ====================================================
inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {can {parent ""} owner x y radius} {
  VaisseauMiniMap_P ${objName}_P $objName $can $owner $x $y $radius
  this inherited $parent "" ${objName}_P ""
}

method VaisseauMiniMap update_drag { x y } {
	${objName}_P update_position $x $y
}
