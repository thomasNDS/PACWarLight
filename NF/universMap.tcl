package require Tk
source utils.tcl
source PAC.tcl

# Generate_PAC_accessors UniversMap "" UniversMap_P value 1

inherit UniversMap_P Presentation
method UniversMap_P constructor {control can} {
  this inherited $control
  #$can create rect 150 0 200 100 -fill white
}

inherit UniversMap Control
method UniversMap constructor {can {parent ""}} {
  UniversMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}





