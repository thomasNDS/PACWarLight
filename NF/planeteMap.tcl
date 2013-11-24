package require Tk
source utils.tcl
source PAC.tcl
source SWL_FC.tcl

# Generate_PAC_accessors UniversMap "" UniversMap_P value 1

inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control can x y radius} {
  this inherited $control
  $can create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill yellow
}

inherit PlaneteMap Control
method PlaneteMap constructor {can {parent ""} x y radius} {
  PlaneteMap_P ${objName}_P $objName $can $x $y $radius
  this inherited $parent "" ${objName}_P ""
}

