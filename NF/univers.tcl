source utils.tcl
source PAC.tcl
source planete.tcl
source planeteMap.tcl
source planeteMiniMap.tcl

Generate_PAC_accessors Univers Univers_A "" countPlan 1
Generate_PAC_accessors Univers Univers_A "" canvMini 1
Generate_PAC_accessors Univers Univers_A "" canvMap 1

# ABSTRACTION ===============================================
inherit Univers_A Abstraction
method Univers_A constructor {control} {
  this inherited $control
  set this(countPlan) 0
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

method Univers addPlanete { x y radius } {
  set namePlanete [[$this(parent) get_swl] generate_uid "Planete"]
  Planete $namePlanete $objName
  PlaneteMap ${namePlanete}_Map [${objName}_A get_canvMap] $namePlanete $x $y $radius
  PlaneteMiniMap ${namePlanete}_MiniMap [${objName}_A get_canvMini] $namePlanete $x $y $radius
}

method Univers setCount {v} {
  ${objName} set_countPlan $v
}

method Univers getCount {} {
   return [${objName} get_countPlan]
}
