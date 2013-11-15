# package require Tk;
# source PAC.tcl
# source introspact.tcl

source SWL_FC.tcl

Generate_PAC_accessors Jeu Jeu_A Jeu_P value 1

inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(value) ""
}

inherit Jeu_P Presentation
method Jeu_P constructor {control} {
}

inherit Jeu Control
method Jeu constructor {{parent ""}} {

  SWL_FC swl

  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}


