package require Tk
source utils.tcl
source PAC.tcl

Generate_PAC_accessors Vaisseau Vaisseau_A Vaisseau_P value 1

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
#   set this(value) ""
}

inherit Vaisseau_P Presentation
method Vaisseau_P constructor {control} {
}

inherit Vaisseau Control
method Vaisseau constructor {{parent ""}} {
  Vaisseau_P ${objName}_P $objName
  Vaisseau_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}