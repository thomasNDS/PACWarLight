
# PRESENTATION ==============================================
inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control can idShip owner x y radius color} {
	set this(x) $x
	set this(y) $y
  	this inherited $control
	set this(canvas) $can
	set this(control) $control

	set this(id) [$can create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill $color -tags [lappend [list background] $idShip]]
	$this(canvas) bind $this(id) <Button-1> [list $objName start_drag %x %y]
}

#start the drag of the planet
method VaisseauMap_P start_drag {x y} {
	set this(last_x) $x
	set this(last_y) $y
	bind $this(canvas) <B1-Motion>       [list $objName update_drag %x %y]
	bind $this(canvas) <ButtonRelease-1> [list $objName stop_drag]
}

# call back method
method VaisseauMap_P update_drag {x y} {
	set dx [expr $x - $this(last_x)]; set this(last_x) $x
	set dy [expr $y - $this(last_y)]; set this(last_y) $y
	set this(x)	$x
	set this(y)     $y
	$this(control) update_drag_map $dx $dy $x $y
	puts "bind"
}

# stop the drag of the planet
method VaisseauMap_P stop_drag {} {
	bind $this(canvas) <B1-Motion> ""
	puts "end drag"
}

# update position
method VaisseauMap_P update_position { x y } {
	 $this(canvas) move $this(id) [expr  $x ] [expr  $y ] 
}

# CONTROLLER ================================================
inherit VaisseauMap Control
method VaisseauMap constructor {can {parent ""} owner x y radius color} {
  set this(parent) $parent
  VaisseauMap_P ${objName}_P $objName $can $this(parent) $owner $x $y $radius $color
  this inherited $parent "" ${objName}_P ""
}

#update the position
method VaisseauMap update_drag { x y } {
	${objName}_P update_position $x $y
}

# detect the drag
method VaisseauMap update_drag_map { dx dy x y } {
	$this(parent) update_drag $dx $dy $x $y 
}





