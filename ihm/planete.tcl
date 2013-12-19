Generate_PAC_accessors Planete Planete_A "" value 1

# ABSTRACTION ===============================================
inherit Planete_A Abstraction
method Planete_A constructor {control} {
  this inherited $control
  set this(value) ""
}
# CONTROLLER ================================================
inherit Planete Control
method Planete constructor {parent id} {
  set this(id) $id
  set this(univers) $parent
  Planete_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Planete update_drag { dx dy } {
	${objName}_MiniMap update_drag $dx $dy
	${objName}_Map update_drag $dx $dy
}

method Planete update_drag { dx dy x y} {
	${objName}_MiniMap update_drag $dx $dy
	${objName}_Map update_drag $dx $dy
	[$this(univers) getKernel] Update_planet $this(id) [dict create x $x y $y]
}

