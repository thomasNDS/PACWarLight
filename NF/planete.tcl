Generate_PAC_accessors Planete Planete_A "" value 1

inherit Planete_A Abstraction
method Planete_A constructor {control} {
  this inherited $control
  set this(value) ""
}

inherit Planete Control
method Planete constructor {{parent ""}} {
  Planete_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}


