Generate_PAC_accessors Joueur Joueur_A "" nom 1
Generate_PAC_accessors Joueur Joueur_A "" color 1
Generate_PAC_accessors Joueur Joueur_A "" idPlayer 1

# ABSTRACTION ===============================================
inherit Joueur_A Abstraction
method Joueur_A constructor {control} {
  this inherited $control
  set this(nom) ""
  set this(idPlayer) ""
  set this(color) ""
}

# PRESENTATION ==============================================
inherit Joueur_P Presentation
method Joueur_P constructor {control} {
}

# CONTROLLER ================================================
inherit Joueur Control
method Joueur constructor {idPlayer nom color {parent ""}} {
  Joueur_A ${objName}_A $objName
  ${objName}_A set_nom $nom
  ${objName}_A set_color $color
  ${objName}_A set_idPlayer $idPlayer
  this inherited $parent ${objName}_A "" ""
}
