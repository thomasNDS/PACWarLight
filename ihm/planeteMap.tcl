
# PRESENTATION ==============================================
inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control can idPlanet x y radius} {
  	this inherited $control

	 set this(id) [$can create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill yellow -tags [lappend [list background] $idPlanet]]
	$can bind background <Button-1>  "set dragged_object object; set last_x %x; set last_y %y"
	set this(dragged_object) ""; set this(last_x) 0; set this(last_y) 0; 
	$can bind $this(id) <Button-1>  "set this(dragged_object) $this(id); set this(last_x) %x; set this(last_y) %y;"
	bind $can <B1-Motion> "${objName} update_drag %x %y $can $control"
}
method PlaneteMap_P update_drag {x y can control} {

			#if {$x >0 && $this(dragged_object) != ""} {
				 set dx [expr $x - $this(last_x)]
				 set dy [expr $y - $this(last_y)]
				 $can move $this(id) $dx $dy
				 $control update_drag_map $dx $dy
				 set last_x $x
				 set last_y $y
			#	}
	}

# CONTROLLER ================================================
inherit PlaneteMap Control
method PlaneteMap constructor {can {parent ""} x y radius} {
  set this(parent) $parent
  PlaneteMap_P ${objName}_P $objName $can $parent $x $y $radius
  this inherited $parent "" ${objName}_P ""
}

method PlaneteMap update_drag_map { x y } {
	$this(parent) update_drag $x $y 
}

