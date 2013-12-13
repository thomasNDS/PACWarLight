package require Tk
source utils.tcl
source PAC.tcl

Generate_PAC_accessors ToolKit ToolKit_A ToolKit_P value 1

# ABSTRACTION ===============================================
inherit ToolKit_A Abstraction
method ToolKit_A constructor {control} {
  this inherited $control
}

# PRESENTATION ==============================================
inherit ToolKit_P Presentation
method ToolKit_P constructor {control can} {
	#Listener de boutons
	button .f.f2.butAddShip -text " Vaisseau " -bg green -command {
		pack .f.f2.butAnnulate -side top 
		set selection "vaisseau"	
	}

	button .f.f2.butAddPlanete -text " Planette " -bg green -command {
		pack .f.f2.butAnnulate -side top 
		set selection "planette"	
	}
	button .f.f2.butAnnulate -text " ANNULER " -bg green -command {
		pack forget .f.f2.butAnnulate
		set selection " "	
	}
	set this(name) ""
	set this(name) [ttk::combobox .f.f2.players -textvariable this(name)  ]
	button .f.f2.addPlayer -text " addPlayer " -bg green -command {
		[list addNameToComboBox $this(name)]
  		set info1 "$name a été ajouté"
	# rajoute un nom de joueur a la comboBox
	proc addNameToComboBox {name} {
	    set values [$name cget -values]
	    set current_value [$name get]
	    if {$current_value ni $values} {
		lappend values $current_value
		$name configure -values $values
	    }
	}
	}
	  

	pack [label .f.f2.lab2 -text "==============\n" -bg green] -side top
	pack .f.f2.players -side top -pady 2
	pack .f.f2.addPlayer -side top
	pack [label .f.f2.info1 -textvariable info1 -bg green ] -side top
	pack [label .f.f2.lab3 -text "==============\n" -bg green] -side top
	pack .f.f2.butAddShip -side top
	pack .f.f2.butAddPlanete -side top
	pack [label .f.f2.labNo -text " \nSelection: " -bg green ] -side top 
	pack [label .f.f2.selection -textvariable selection -bg green ] -side top 

}

# CONTROLLER ================================================
inherit ToolKit Control
method ToolKit constructor {{parent ""} can } {
  ToolKit_P ${objName}_P $objName $can
  ToolKit_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}
method ToolKit addPlanete { x y radius } {

}

method ToolKit addShip { x y angle } {

}




