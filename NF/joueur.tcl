package require Tk
source utils.tcl
source PAC.tcl

Generate_PAC_accessors Joueur Joueur_A "" nom 1
Generate_PAC_accessors Joueur Joueur_A "" color 1

# ABSTRACTION ===============================================
inherit Joueur_A Abstraction
method Joueur_A constructor {control} {
  this inherited $control
  set this(nom) ""
  set this(color) ""
}

# CONTROLLER ================================================
inherit Joueur Control
method Joueur constructor {nom color {parent ""}} {
  Joueur_A ${objName}_A $objName
  ${objName}_A set_nom $nom
  ${objName}_A set_color $color
  this inherited $parent ${objName}_A ${objName}_P ""
}
