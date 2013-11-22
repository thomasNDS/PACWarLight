package require Tk
source utils.tcl
source PAC.tcl

# Generate_PAC_accessors UniversMap "" UniversMap_P value 1

inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control can} {
  this inherited $control
#   toplevel ._$objName
#   frame ._$objName.fram
#   canvas ._$objName.fram.c
# # 
#   canvas .c
#   pack .c -fill both -expand 1
  
#   ._$objName configure -background red
# 
#   ._$objName.fram.c create rect 0 0 10000 10000 -fill blue
  $can create rect 0 0 15 25 -fill yellow
#   pack $can
#   pack ._$objName.fram
#   pack ._$objName.fram.c
#   pack .c -expand 1 -fill both
}

inherit PlaneteMap Control
method PlaneteMap constructor {can {parent ""}} {
  PlaneteMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}

