package require Tk
source utils.tcl
source PAC.tcl

# Generate_PAC_accessors UniversMiniMap "" UniversMiniMap_P value 1

inherit UniversMiniMap_P Presentation
method UniversMiniMap_P constructor {control can} {
  this inherited $control
  #$can create rect 50 0 100 50 -fill white
}

inherit UniversMiniMap Control
method UniversMiniMap constructor {can {parent ""}} {
  UniversMiniMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}





