
# PRESENTATION ==============================================
inherit PlaneteMap_P Presentation

method PlaneteMap_P constructor {control can idPlanet scale x y radius densite} {
	set this(scale) 1
	set this(x) $x
	set this(y) $y
 	
	set this(canvas) $can
	set this(control) $control

	set this(id) [$this(canvas) create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill yellow -tags [lappend [list background] $idPlanet]]
	$this(canvas) bind $this(id) <Button-1> [list $objName start_drag %x %y]

	this inherited $control
}

#start the drag of the planet
method PlaneteMap_P start_drag {x y} {
	set this(last_x) $x
	set this(last_y) $y
	bind $this(canvas) <B1-Motion>       [list $objName update_drag %x %y]
	bind $this(canvas) <ButtonRelease-1> [list $objName stop_drag]
}

# call back method
method PlaneteMap_P update_drag {x y} {
	set dx [expr $x - $this(last_x)]; set this(last_x) $x
	set dy [expr $y - $this(last_y)]; set this(last_y) $y
	set this(x)	$x
	set this(y)     $y
	$this(control) detect_drag_map $dx $dy
	puts "bind"
}

# stop the drag of the planet
method PlaneteMap_P stop_drag {} {
	bind $this(canvas) <B1-Motion> ""
	puts "end drag"
}

# update position
method PlaneteMap_P update_position { x y } {
	 $this(canvas) move $this(id) [expr  $x ] [expr  $y ] 
}

# CONTROLLER ================================================
inherit PlaneteMap Control
method PlaneteMap constructor {can {parent ""} x y radius} {
  set this(parent) $parent
  PlaneteMap_P ${objName}_P $objName $can $parent 1 $x $y $radius 1
  this inherited $parent "" ${objName}_P ""
}

method PlaneteMap update_drag { x y } {
	${objName}_P update_position $x $y
}

method PlaneteMap detect_drag_map { x y } {
	$this(parent) update_drag $x $y 
}





