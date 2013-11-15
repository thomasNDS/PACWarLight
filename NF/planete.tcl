Generate_PAC_accessors Planete Planete_A Planete_P value 1

inherit Planete_A Abstraction
method Planete_A constructor {control} {
  this inherited $control
  set this(value) ""
}

inherit Planete_P Presentation
method Planete_P constructor {control} {
}

inherit Planete Control
method Planete constructor {{parent ""}} {
  Planete_P ${objName}_P $objName
  Planete_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}


