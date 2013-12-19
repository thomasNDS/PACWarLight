Generate_PAC_accessors Vaisseau Vaisseau_A Vaisseau_P value 1

# ABSTRACTION ===============================================
inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
}


# CONTROLLER ================================================
inherit Vaisseau Control
method Vaisseau constructor {owner {parent ""}} {
  Vaisseau_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Vaisseau update_drag { dx dy } {
	${objName}_MiniMap update_drag $dx $dy
	${objName}_Map update_drag $dx $dy
}
