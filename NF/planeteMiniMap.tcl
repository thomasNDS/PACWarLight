package require Tk
source utils.tcl
source PAC.tcl
source SWL_FC.tcl

# Generate_PAC_accessors UniversMiniMap "" UniversMiniMap_P value 1

inherit PlaneteMiniMap_P Presentation
method PlaneteMiniMap_P constructor {control can x y radius} {
  this inherited $control
  set radius [expr 0.33 * $radius]
  set x [expr 0.33 * $x]
  set y [expr 0.33 * $y]
  $can create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill yellow
}

inherit PlaneteMiniMap Control
method PlaneteMiniMap constructor {can {parent ""} x y radius} {
  PlaneteMiniMap_P ${objName}_P $objName $can $x $y $radius
  this inherited $parent "" ${objName}_P ""
}
