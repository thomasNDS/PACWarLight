Generate_PAC_accessors Vaisseau Vaisseau_A Vaisseau_P value 1

# ABSTRACTION ===============================================
inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
}

# CONTROLLER ================================================
inherit Vaisseau Control
method Vaisseau constructor {owner parent id} {
  set this(id) $id
  set this(owner) $owner
  set this(univers) $parent
  Vaisseau_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Vaisseau update_drag { dx dy my_x my_y} {
	${objName}_MiniMap update_drag $dx $dy
	${objName}_Map update_drag $dx $dy
	puts "[$this(univers) getKernel] Update_ship $this(owner) [dict create x $my_x y $my_y]"
	[$this(univers) getKernel] Update_ship $this(owner) $this(id) [dict create x $my_x y $my_y]
}


