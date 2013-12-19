source planete.tcl
source planeteMap.tcl
source planeteMiniMap.tcl
source vaisseau.tcl
source vaisseauMap.tcl
source vaisseauMiniMap.tcl

Generate_PAC_accessors Univers Univers_A "" countPlan 1
Generate_PAC_accessors Univers Univers_A "" canvMini 1
Generate_PAC_accessors Univers Univers_A "" canvMap 1

# ABSTRACTION ===============================================
inherit Univers_A Abstraction
method Univers_A constructor {control} {
  this inherited $control
  set this(canvMini) ""
  set this(canvMap) ""
}

# CONTROLLER ================================================
inherit Univers Control
method Univers constructor {{parent ""}} {
  Univers_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
  ${objName}_A set_canvMini [$this(parent) getCanvMini]
  ${objName}_A set_canvMap [$this(parent) getCanvMap]
}

method Univers addPlanete { x y radius density} {
#   set namePlanete [[$this(parent) get_swl] generate_uid "Planete"]
  set idPlanete [[$this(parent) get_swl] Add_new_planet $x $y $radius $density]
  Planete $idPlanete $objName
  PlaneteMap ${idPlanete}_Map [${objName}_A get_canvMap] $idPlanete $x $y $radius
  PlaneteMiniMap ${idPlanete}_MiniMap [${objName}_A get_canvMini] $idPlanete $x $y $radius
}

method Univers addVaisseau { owner x y radius color} {
#   set idShip [[$this(parent) get_swl] generate_uid "Vaisseau"]
  #Obtention id avec ajout dans swl
  set idShip [[$this(parent) get_swl] Add_new_ship $owner $x $y $radius]
  #Update du vaisseau dans swl pour crée l'angle et la velocité
  [$this(parent) get_swl] Update_ship $owner $idShip [dict create fire_velocity 20 fire_angle 1]
  #Création de l'agent vaisseau
  Vaisseau $idShip $owner $objName
  VaisseauMap ${idShip}_Map [${objName}_A get_canvMap] $idShip $owner $x $y $radius $color
  VaisseauMiniMap ${idShip}_MiniMap [${objName}_A get_canvMini] $idShip $owner $x $y $radius $color
}

method Univers stepBeginComputation {L_bullets} {
  [${objName}_A get_canvMap] delete Bullet
  [${objName}_A get_canvMini] delete Bullet
  set radius 2
	foreach {id x y vx vy} $L_bullets {
		 [${objName}_A get_canvMap] create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill black -tags [list Bullet $id]
		 [${objName}_A get_canvMini] create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill black -tags [list Bullet $id]
		}
}
  
method Univers stepComputation {L_bullets} {
  set radius 2
  foreach {id x y vx vy} $L_bullets {
	    [${objName}_A get_canvMap] coords $id [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius]
	    [${objName}_A get_canvMini] coords $id [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius]
	  }
}

method Univers destroyShip {idShip} {
#   puts $idShip
  [${objName}_A get_canvMap] delete $idShip
  [${objName}_A get_canvMini] delete $idShip
}