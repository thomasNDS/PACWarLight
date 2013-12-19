package require Tk
source utils.tcl
source PAC.tcl
source SWL_FC.tcl

# PRESENTATION ==============================================
inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control can owner x y radius} {
  	this inherited $control

	proc update_drag {x y can control} {
		global dragged_object
		global last_x
		global last_y

			if {$x >0 && $dragged_object != ""} {
				 set dx [expr $x - $last_x]
				 set dy [expr $y - $last_y]
				 $can move $dragged_object $dx $dy
				 set last_x $x
				 set last_y $y
				}
		$control update_drag_map $dx $dy
	}

	 set id [$can create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill green -tags [list background]]
	$can bind background <Button-1>  "set dragged_object object; set last_x %x; set last_y %y"
	set dragged_object ""; set last_x ""; set last_y "";
	puts $id
	$can bind $id <Button-1>  "set dragged_object $id; set last_x %x; set last_y %y;"
	bind $can <B1-Motion> "update_drag %x %y $can $control"
}

# CONTROLLER ================================================
inherit VaisseauMap Control
method VaisseauMap constructor {can {parent ""} owner x y radius} {
  set this(parent) $parent
  VaisseauMap_P ${objName}_P $objName $can $owner $x $y $radius
  this inherited $parent "" ${objName}_P ""
}

method VaisseauMap update_drag_map { x y } {
	$this(parent) update_drag $x $y 
}
