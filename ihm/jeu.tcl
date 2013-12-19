source univers.tcl
source universMap.tcl
source universMiniMap.tcl
source joueur.tcl
source ToolKit.tcl

Generate_PAC_accessors Jeu Jeu_A Jeu_P swl 1
Generate_PAC_accessors Jeu Jeu_A "" canvMini 1
Generate_PAC_accessors Jeu Jeu_A "" canvMap 1
Generate_PAC_accessors Jeu Jeu_A "" dictJoueurs 1
Generate_PAC_accessors Jeu Jeu_A "" nbPlayer 1
Generate_PAC_accessors Jeu Jeu_A "" selectedPlayer 1


# ABSTRACTION ===============================================
inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(swl) ""
  set this(canvMini) ""
  set this(canvMap) ""
  set this(nbPlayer) ""
  set this(dictJoueurs) [dict create]
  set this(selectedPlayer) ""
}

# PRESENTATION ==============================================
inherit Jeu_P Presentation
	method Jeu_P constructor {control} {
}

# CONTROLLER ================================================
inherit Jeu Control
method Jeu constructor {canvMini canvMap {parent ""}} {
  SWL_FC swl
  set this(swl) swl 
  set this(univers) "univ"
  set nbPlayer 0
  set selected 1
  
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  
  ${objName}_A set_swl swl
  ${objName}_A set_canvMini $canvMini
  ${objName}_A set_canvMap $canvMap
  ${objName}_A set_nbPlayer $nbPlayer
  ${objName}_A set_selectedPlayer $selected
  
  this inherited $parent ${objName}_A ${objName}_P ""
  
  swl Subscribe_after_Start_fire startID {
    puts "liste de bullets : $this(L_bullets)"
    "univ" stepBeginComputation $this(L_bullets)
  }
  
  swl Subscribe_after_Compute_a_simulation_step computeID {
    "univ" stepComputation $this(L_bullets)
  }
  
  swl Subscribe_after_Destroy_ship destroyShipID {
    "univ" destroyShip $id
    puts "Destroy ship $id";
  }
  
}

method Jeu addPlanete {x y radius density} {
  $this(univers) addPlanete $x $y $radius $density
}

method Jeu addVaisseau {owner x y radius color} {
  #Récupère l'id du joueur pour pouvoir le donner a l'ajout de vaisseau
  set idOwner [${objName} getIdPlayerByName $owner]
  puts "Ajout d'un vaisseau pour : $idOwner"
  $this(univers) addVaisseau $idOwner $x $y $radius $color
}

method Jeu getIdPlayerByName { owner } {
  return [dict keys [dict filter $this(dictJoueurs) value $owner]]
}

method Jeu addJoueur {nom color} {
  #On incrémente le nombre de joueur
  ${objName}_A set_nbPlayer [expr [${objName}_A get_nbPlayer] + 1]
  #Obtention de l'id joueur via l'ajout du joueur dans le swl, il lui crée l'id
  #et l'ajoute dans une liste
  set idJoueur [[${objName}_A get_swl] Add_new_player $nom]
  #Ajout de l'id et du nom de joueur dans un dico de jeu
  #Cela afin de pouvoir retrouver plus tard l'id du joueur avec son nom
  dict set this(dictJoueurs) $idJoueur $nom
  #Création du joueur
  Joueur $nom $idJoueur $nom $color $objName
#   lappend [${objName}_A get_dictJoueurs] $nom
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
method Jeu selectPlayer { selectedPlayer } {
 puts $selectedPlayer
 ${objName}_A set_selectedPlayer $selectedPlayer
}

#Retourne le nom du joueur selectionné
method Jeu getSelectedPlayer {} {
  set owner ""
  puts "joueur selectionné : [${objName}_A get_selectedPlayer]"
  if {[${objName}_A get_selectedPlayer] == 1} { 
    lappend owner "j1"
    lappend owner "red"
  } elseif {[${objName}_A get_selectedPlayer] == 2} {
    lappend owner "j2"
    lappend owner "blue"
  }
  return $owner
}

#Lance le jeu
method Jeu startGame { start } {
 puts "start"
 [${objName}_A get_swl] Start_fire
}

method Jeu startFire {} {
  [${objName}_A get_swl] Start_fire
}



