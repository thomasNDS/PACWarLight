package require Tk
source utils.tcl
source PAC.tcl

# Generate_PAC_accessors UniversMiniMap "" UniversMiniMap_P value 1

inherit UniversMiniMap_P Presentation
method UniversMiniMap_P constructor {control can} {
  this inherited $control
#   toplevel ._$objName
#   frame ._$objName.fram
#   canvas ._$objName.fram.c
# 
#   canvas .c
#   pack .c -fill both -expand 1
  
#   ._$objName configure -background red

#   ._$objName.fram.c create rect 0 0 500 500 -fill red
  $can create rect 50 0 100 50 -fill red
#   pack $can
#   pack ._$objName.fram
#   pack ._$objName.fram.c
#   pack .c -expand 1 -fill both
}

inherit UniversMiniMap Control
method UniversMiniMap constructor {can {parent ""}} {
  UniversMiniMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}





