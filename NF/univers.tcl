package require Tk
source utils.tcl
source PAC.tcl
source planete.tcl

Generate_PAC_accessors Univers Univers_A "" countPlan 1

inherit Univers_A Abstraction
method Univers_A constructor {control} {
  this inherited $control
  set this(countPlan) 0
#   set this(value) ""
}

inherit Univers Control
method Univers constructor {{parent ""}} {
#   Univers_P ${objName}_P $objName
  Univers_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Univers addPlanete {} {
#   Planete "planete[expr [this getCount] + 1]" $objName
  Planete [[$this(parent) get_swl] generate_uid "Planete"] $objName
  this setCount [expr [this getCount] + 1]
}

method Univers setCount {v} {
  ${objName} set_countPlan $v
}

method Univers getCount {} {
   return [${objName} get_countPlan]
}
