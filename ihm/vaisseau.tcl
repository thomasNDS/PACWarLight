Generate_PAC_accessors Vaisseau Vaisseau_A Vaisseau_P value 1

# ABSTRACTION ===============================================
inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
}

# CONTROLLER ================================================
inherit Vaisseau Control
method Vaisseau constructor {owner parent id fire angle } {
  set this(fire) $fire
  set this(angle) $angle
  set this(id) $id
  set this(owner) $owner
  set this(univers) $parent
  Vaisseau_A ${objName}_A $objName
  this inherited $parent ${objName}_A "" ""
}

method Vaisseau update_drag { dx dy my_x my_y} {
	${objName}_MiniMap update_drag $dx $dy
	${objName}_Map update_drag $dx $dy
	[$this(univers) getKernel] Update_ship $this(owner) $this(id) [dict create x $my_x y $my_y]
}

method Vaisseau isbind { x y } {
	$this(univers) setShipSelected $x $y $this(fire) $this(angle) $this(id)
}

method Vaisseau set_infos { fireAngle velocity} {
	[$this(univers) getKernel] Update_ship $this(owner) $this(id) [dict create fire_angle $fireAngle fire_velocity $velocity]
}

method Vaisseau updateInfo {angle vel} {
	set this(angle) $angle
	set this(fire) $vel
	${objName} set_infos $angle $vel
}





