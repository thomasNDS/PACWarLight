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
	set this(stateGame) 0

	pack [label .f.f2.strAngle -text "Angle"] -side top
	pack [entry .f.f2.angle -width 15 -relief sunken ] -side top
	pack [label .f.f2.strvitesse -text "vitesse"] -side top
	pack [entry .f.f2.velocity -width 15 -relief sunken ] -side top
	button .f.f2.butOK -text " Valider " -command [list $objName validate ]
	pack .f.f2.butOK -side top
  
	pack [label .f.f2.lab2 -text "\n==== Joueurs ====" ] -side top
	button .f.f2.butj1 -text "Joueur 1" -bg red -command [list $objName selectPlayer 1 ]
	button .f.f2.butj2 -text "Joueur 2" -bg green -command [list $objName selectPlayer 2 ]
	pack .f.f2.butj1 -side top
	pack .f.f2.butj2 -side top
	pack [label .f.f2.lab3 -text "==== Elements ====\n"] -side top
	button .f.f2.butselectShip -text " Vaisseau " -bg green -command [list $objName selectShip ]
	button .f.f2.butselectPlanete -text " Planete " -bg green -command [list $objName selectPlanet ]
	button .f.f2.butAnnulate -text " ANNULER "  -command [list $objName annulateSelect ] 
	pack .f.f2.butselectShip -side top
	pack .f.f2.butselectPlanete -side top
	pack [label .f.f2.labNo -text " \nSelection: " ] -side top 
	pack [label .f.f2.selection -text "rien" -bg lightgreen ] -side top 
	button .f.f2.start -text " START " -bg lightblue -width 15 -command [list $objName startGame 1 ]
	pack .f.f2.start -side top
}
#Selection de vaisseaux
method ToolKit_P selectShip {} {
	pack .f.f2.butAnnulate -side top 
	puts "vaisseau"
	.f.f2.selection configure -text "vaisseau"
	$this(control) selectShip
	.f.f2.butselectShip configure -bg red
	.f.f2.butselectPlanete configure -bg green
}
#Stop la selection de planette ou vaisseaux
method ToolKit_P annulateSelect {} {
	pack forget .f.f2.butAnnulate	
	.f.f2.selection configure -text "rien"
	$this(control) stopSelect
	.f.f2.butselectShip configure -bg green
	.f.f2.butselectPlanete configure -bg green
}
#Selection de planette
method ToolKit_P selectPlanet {} {
	pack .f.f2.butAnnulate -side top 	
	.f.f2.selection configure -text "planete"
	$this(control) selectPlanete
	.f.f2.butselectShip configure -bg green
	.f.f2.butselectPlanete configure -bg red
}
#Selection de joueurs
method ToolKit_P selectPlayer { player } {
 $this(control) selectPlayer $player
 .f.f2.butj$player configure -bg red
 .f.f2.butj$this(buttonSelect) configure -bg green
 set this(buttonSelect) $player
}
#Lance le jeu
method ToolKit_P startGame { start } {
 set this(stateGame) $start
 $this(control) startGame $start
}
#select a ship
method ToolKit_P setShipSelected {x y fire angle } {
	.f.f2.angle delete 0 end
	.f.f2.angle insert 0 $angle
	.f.f2.velocity delete 0 end
	.f.f2.velocity insert 0 $fire
}
method ToolKit_P validate {} {
	set angle [.f.f2.angle get]
	set velocity [.f.f2.velocity get]
	$this(control) updateInfo $angle $velocity
}

# CONTROLLER ================================================
inherit ToolKit Control
method ToolKit constructor {{parent ""} can } {
  ToolKit_P ${objName}_P $objName $can
  ToolKit_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  set this(jeu) $parent
}
#met a jour les infos
method ToolKit updateInfo {angle vel} {
   $this(jeu) updateInfoShip $angle $vel
}

# stop la selection de planette ou vaisseaux
method ToolKit stopSelect {} {
   puts "stop select"
   $this(jeu) stopSelect
}
#selection de planette
method ToolKit selectPlanete { } {
   puts "select planete"
   $this(jeu) selectPlanete
}
#selection de vaisseaux
method ToolKit selectShip { } {
 puts "select ship"
 $this(jeu) selectShip
}
#selection de joueurs
method ToolKit selectPlayer { player } {
 $this(jeu) selectPlayer $player
}
#Lance le jeu
method ToolKit startGame { start } {
 puts "start"
 $this(jeu) startGame $start
}

method ToolKit setShipSelected {x y fire angle } {
	${objName}_P setShipSelected $x $y $fire $angle
}



