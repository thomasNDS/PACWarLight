source utils.tcl
source PAC.tcl
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

method Univers addPlanete { x y radius swl } {
  set namePlanete [[$this(parent) get_swl] generate_uid "Planete"]
  Planete $namePlanete $objName $swl
  PlaneteMap ${namePlanete}_Map [${objName}_A get_canvMap] $namePlanete $x $y $radius
  PlaneteMiniMap ${namePlanete}_MiniMap [${objName}_A get_canvMini] $namePlanete $x $y $radius
}

method Univers addVaisseau { owner x y radius } {
  set idShip [[$this(parent) get_swl] generate_uid "Vaisseau"]
  Vaisseau $idShip $owner $objName
  VaisseauMap ${idShip}_Map [${objName}_A get_canvMap] $idShip $owner $x $y $radius
  VaisseauMiniMap ${idShip}_MiniMap [${objName}_A get_canvMini] $idShip $owner $x $y $radius
}
