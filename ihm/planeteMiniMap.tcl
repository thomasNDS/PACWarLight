
# Vue minimap d'une planète

#PRESENTATION ====================================================

inherit PlaneteMiniMap_P Presentation
method PlaneteMiniMap_P constructor {control can x y radius} {
  this inherited $control
  set radius [expr 0.33 * $radius]
  set x [expr 0.33 * $x]
  set y [expr 0.33 * $y]
  set this(canvas) $can
  set this(planete) [$this(canvas) create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill yellow ]
}

method PlaneteMiniMap_P update_position { x y } {
	 $this(canvas) move $this(planete) [expr 0.33 * $x ] [expr 0.33 * $y ] 
}

# CONTROLLER ====================================================
inherit PlaneteMiniMap Control
method PlaneteMiniMap constructor {can {parent ""} x y radius} {
  PlaneteMiniMap_P ${objName}_P $objName $can $x $y $radius
  this inherited $parent "" ${objName}_P ""
}

method PlaneteMiniMap update_drag { x y } {
	${objName}_P update_position $x $y
}
