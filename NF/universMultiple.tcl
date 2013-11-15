source univers.tcl
source universMap.tcl
source universMiniMap.tcl

canvas .c
pack .c -expand 1 -fill both

Univers univ

UniversMap univMap .c 
UniversMiniMap univMiniMap .c

set univMap(parent) "univ"
set univMiniMap(parent) "univ"

univ append univMap
univ append univMiniMap
