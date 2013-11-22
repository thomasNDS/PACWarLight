# package require Tk
source utils.tcl
source PAC.tcl
source planete.tcl
source planeteMap.tcl
source planeteMiniMap.tcl

Generate_PAC_accessors Univers Univers_A "" countPlan 1
Generate_PAC_accessors Univers Univers_A "" canvMini 1
Generate_PAC_accessors Univers Univers_A "" canvMap 1

inherit Univers_A Abstraction
method Univers_A constructor {control} {
  this inherited $control
  set this(countPlan) 0
  set this(canvMini) ""
  set this(canvMap) ""
}


inherit Univers Control
method Univers constructor {{parent ""}} {
#   Univers_P ${objName}_P $objName
  Univers_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
  
  ${objName}_A set_canvMini [$this(parent) getCanvMini]
  ${objName}_A set_canvMap [$this(parent) getCanvMap]
}

method Univers addPlanete {} {
#   Planete "planete[expr [this getCount] + 1]" $objName
  set namePlanete [[$this(parent) get_swl] generate_uid "Planete"]
  Planete $namePlanete $objName
  PlaneteMap ${namePlanete}_Map [${objName}_A get_canvMap] $namePlanete
  PlaneteMiniMap ${namePlanete}_MiniMap [${objName}_A get_canvMini] $namePlanete
#   this setCount [expr [this getCount] + 1]
}

method Univers setCount {v} {
  ${objName} set_countPlan $v
}

method Univers getCount {} {
   return [${objName} get_countPlan]
}
