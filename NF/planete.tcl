Generate_PAC_accessors Planete Planete_A "" value 1

# ABSTRACTION ===============================================
inherit Planete_A Abstraction
method Planete_A constructor {control} {
  this inherited $control
  set this(value) ""
}
# CONTROLLER ================================================
inherit Planete Control
method Planete constructor {{parent ""} swl} {
  set this(swl) swl
  Planete_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Planete update_drag { x y } {
	${objName}_MiniMap update_drag $x $y
}


