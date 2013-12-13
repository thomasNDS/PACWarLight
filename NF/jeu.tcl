source univers.tcl
source universMap.tcl
source universMiniMap.tcl
source joueur.tcl
source introspact.tcl
source SWL_FC.tcl
source ToolKit.tcl

Generate_PAC_accessors Jeu Jeu_A Jeu_P swl 1
Generate_PAC_accessors Jeu Jeu_A "" canvMini 1
Generate_PAC_accessors Jeu Jeu_A "" canvMap 1
Generate_PAC_accessors Jeu Jeu_A "" dictJoueurs 1

# ABSTRACTION ===============================================
inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(swl) ""
  set this(canvMini) ""
  set this(canvMap) ""
  set this(dictJoueurs) [dict create]
}

# PRESENTATION ==============================================
inherit Jeu_P Presentation
	method Jeu_P constructor {control} {
}

# CONTROLLER ================================================
inherit Jeu Control
method Jeu constructor {canvMini canvMap {parent ""}} {
  set this(player) 1
  SWL_FC swl
  set this(swl) swl 
  set this(univers) "univ"
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  
  ${objName}_A set_swl swl
  ${objName}_A set_canvMini $canvMini
  ${objName}_A set_canvMap $canvMap

  this inherited $parent ${objName}_A ${objName}_P ""
}

# method Jeu createUnivers {canvas} {
#   pack $canvas -expand 1 -fill both
# 
#   Univers univ $objName 
#   UniversMap univMap $canvas 
#   UniversMiniMap univMiniMap $canvas
#   set this(univers) univ
# 
#   univ append univMap
#   univ append univMiniMap
# }

method Jeu addPlanete {x y radius} {
  $this(univers) addPlanete $x $y $radius this(swl)
}

method Jeu addVaisseau {x y radius} {
  $this(univers) addVaisseau "toto" $x $y $radius
}

method Jeu addJoueur {nom color} {
 set idJoueur [[${objName}_A get_swl] Add_new_player "Joueur"]
 Joueur $idJoueur $nom $color $objName
 lappend [${objName}_A get_dictJoueurs] $nom
}

method Jeu addUnivers {univ} {
  $objName append $univ
}

method Jeu getSwl {} {
   return [${objName} get_swl]
}

method Jeu getCanvMini {} {
   return [${objName} get_canvMini]
}

method Jeu getCanvMap {} {
   return [${objName} get_canvMap]
}

# stop la selection de planette ou vaisseaux
method Jeu stopSelect {} {
   puts "select planete"
}
#selection de planette
method Jeu selectPlanete { } {
   puts "select planete"
}
#selection de vaisseaux
method Jeu selectShip { } {
 puts "select ship"
}
#selection de joueurs
method Jeu selectPlayer { player } {
 set this(player) $player
}
#Lance le jeu
method Jeu startGame { start } {
 puts "start"
}




