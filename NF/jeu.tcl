# package require Tk;
source univers.tcl
source universMap.tcl
source universMiniMap.tcl
source introspact.tcl
source SWL_FC.tcl

Generate_PAC_accessors Jeu Jeu_A Jeu_P swl 1
Generate_PAC_accessors Jeu Jeu_A "" canvMini 1
Generate_PAC_accessors Jeu Jeu_A "" canvMap 1
Generate_PAC_accessors Jeu Jeu_A "" dictJoueurs 1


inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(swl) ""
  set this(canvMini) ""
  set this(canvMap) ""
  
  set this(dictJoueurs) [dict create]
}

inherit Jeu_P Presentation
method Jeu_P constructor {control} {
}

inherit Jeu Control
method Jeu constructor {canvMini canvMap {parent ""}} {

  SWL_FC swl
  
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  
  ${objName}_A set_swl swl
  ${objName}_A set_canvMini $canvMini
  ${objName}_A set_canvMap $canvMap
  
  
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

method Jeu addPlanete {} {
  $this(children) addPlanete 
#   UniversMap univMap $canvas 
#   $objName append $univ
}

method Jeu addJoueur(nom color){
  lappend [${objName}_A get_dictJoueurs] 
}

method Jeu addUnivers {univ} {
  $objName append $univ
}

method Jeu getSwl {} {
   return [${objName} get_swl]
}

method Jeu getCanvMini {} {
   return [${objName} get_canvMini]
}

method Jeu getCanvMap {} {
   return [${objName} get_canvMap]
}

