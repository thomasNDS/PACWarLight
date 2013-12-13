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
	set this(control) $control
	set this(name) ""
	set this(buttonSelect) 1

	#Listener de boutons	  
	pack [label .f.f2.lab2 -text "==== Joueurs ====\n" -bg green] -side top
	pack [label .f.f2.info1 -textvariable info1 -bg green ] -side top
	button .f.f2.butj1 -text "Joueur 1" -bg red -command [list $objName selectPlayer 1 ]
	button .f.f2.butj2 -text "Joueur 2" -bg green -command [list $objName selectPlayer 2 ]
	pack .f.f2.butj1 -side top
	pack .f.f2.butj2 -side top
	pack [label .f.f2.lab3 -text "==== Elements ====\n" -bg green] -side top

	button .f.f2.butselectShip -text " Vaisseau " -bg green -command [list $objName selectShip ]
	button .f.f2.butselectPlanete -text " Planette " -bg green -command [list $objName selectPlanet ]
	button .f.f2.butAnnulate -text " ANNULER " -bg green -command [list $objName annulateSelect ] 
	pack .f.f2.butselectShip -side top
	pack .f.f2.butselectPlanete -side top
	pack [label .f.f2.labNo -text " \nSelection: " -bg green ] -side top 
	pack [label .f.f2.selection -text "rien" -bg green ] -side top 
}
#selection de vaisseaux
method ToolKit_P selectShip {} {
	pack .f.f2.butAnnulate -side top 
	puts "vaisseau"
	.f.f2.selection configure -text "vaisseau"
	$this(control) selectShip
	.f.f2.butselectShip configure -bg red
	.f.f2.butselectPlanete configure -bg green
}
# stop la selection de planette ou vaisseaux
method ToolKit_P annulateSelect {} {
	pack forget .f.f2.butAnnulate	
	.f.f2.selection configure -text "rien"
	$this(control) stopSelect
	.f.f2.butselectShip configure -bg green
	.f.f2.butselectPlanete configure -bg green
}
#selection de planette
method ToolKit_P selectPlanet {} {
	pack .f.f2.butAnnulate -side top 	
	.f.f2.selection configure -text "planette"
	$this(control) selectPlanete
	.f.f2.butselectShip configure -bg green
	.f.f2.butselectPlanete configure -bg red
}
#selection de joueurs
method ToolKit_P selectPlayer { player } {
 $this(control) selectPlayer $player
 .f.f2.butj$player configure -bg red
 .f.f2.butj$this(buttonSelect) configure -bg green
 set this(buttonSelect) $player
}

# CONTROLLER ================================================
inherit ToolKit Control
method ToolKit constructor {{parent ""} can } {
  ToolKit_P ${objName}_P $objName $can
  ToolKit_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  set this(jeu) $parent
}

# stop la selection de planette ou vaisseaux
method ToolKit stopSelect {} {
   puts "select planete"
}

#selection de planette
method ToolKit selectPlanete { } {
   puts "select planete"
}
#selection de vaisseaux
method ToolKit selectShip { } {
 puts "select ship"
}
#selection de joueurs
method ToolKit selectPlayer { player } {
 puts "select $player"
}



