package require Tk
source utils.tcl
source PAC.tcl
source planete.tcl

# Generate_PAC_accessors Univers Univers_A "" value 1

inherit Univers_A Abstraction
method Univers_A constructor {control} {
  this inherited $control
#   set this(value) ""
}

# inherit Univers_P Presentation
# method Univers_P constructor {control} {
#   this inherited $control
#   toplevel ._$objName
#   frame ._$objName.fram
#   canvas ._$objName.fram.c
# # 
# #   canvas .c
# #   pack .c -fill both -expand 1
#   
# #   ._$objName configure -background red
#   
#   set x  50
#   set y  50
#   set radius  2
#   ._$objName.fram.c create rect 0 0 10000 10000 -fill black
#   ._$objName.fram.c create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill green
#   
#   pack ._$objName.fram
#   pack ._$objName.fram.c
# #   pack .c -expand 1 -fill both
# }

inherit Univers Control
method Univers constructor {{parent ""}} {
#   Univers_P ${objName}_P $objName
  Univers_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Univers addPlanete {} {
  Planete pl $objName
}


