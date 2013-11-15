package require Tk
source utils.tcl
source PAC.tcl

Generate_PAC_accessors Joueur Joueur_A Joueur_P value 1

inherit Joueur_A Abstraction
method Joueur_A constructor {control} {
  this inherited $control
#   set this(value) ""
}

inherit Joueur_P Presentation
method Joueur_P constructor {control} {
}

inherit Joueur Control
method Joueur constructor {{parent ""}} {
  Joueur_P ${objName}_P $objName
  Joueur_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}