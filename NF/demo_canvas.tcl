package require Tk
canvas .c
pack .c -fill both -expand 1

proc update_drag {x y } {
	global dragged_object
	global last_x
	global last_y

		if {$x >0 && $dragged_object != ""} {
			 set dx [expr $x - $last_x]
			 set dy [expr $y - $last_y]
			 .c move $dragged_object $dx $dy
			 set last_x $x
			 set last_y $y
			}
}

.c create rect 0 0 10000 10000 -fill black -tags [list background]
.c bind background <Button-1>  "set dragged_object object; set last_x %x; set last_y %y"

set dragged_object ""; set last_x ""; set last_y ""; set ray "";
set col [list red blue green yellow]
#for {set i 0} {$i < 10} {incr i} {
	 set superSizeMe 200
	 set id [.c create oval [expr 50] [expr 50] [expr $superSizeMe] [expr $superSizeMe] \
							-fill [lindex $col [expr 100 % [llength $col]]] \
							-tags [list object] ]
	 .c bind $id <Button-1>  "set dragged_object $id; set last_x %x; set last_y %y; set ray 200;"
#	}

bind .c <B1-Motion> "update_drag %x %y"

