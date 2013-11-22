# package require Tk;
source univers.tcl
source universMap.tcl
source universMiniMap.tcl
source introspact.tcl
source SWL_FC.tcl

Generate_PAC_accessors Jeu Jeu_A Jeu_P swl 1

inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(swl) ""
}

inherit Jeu_P Presentation
method Jeu_P constructor {control} {
}

inherit Jeu Control
method Jeu constructor {canv {parent ""}} {

  SWL_FC swl
#    set this(swl) swl
#   this setSwl $swl
  
  
  set this(canvJeu) $canv
  
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  
  ${objName}_A set_swl swl
  
  this inherited $parent ${objName}_A ${objName}_P ""
}

method Jeu createUnivers {canvas} {
  pack $canvas -expand 1 -fill both

  Univers univ $objName 

  UniversMap univMap $canvas 
  UniversMiniMap univMiniMap $canvas
  
  univ append univMap
  univ append univMiniMap
  
#   $objName append univ
}

method Jeu addTruc {} {
  $this(children) addPlanete 
#   UniversMap univMap $canvas 
#   $objName append $univ
}

method Jeu addUnivers {univ} {
  $objName append $univ
}

method Jeu setSwl {swl} {
  ${objName} set_swl $swl
}

method Jeu getSwl {} {
   return [${objName} get_swl]
}

# Jeu j
#   Introspact i
#   i attach $objName
