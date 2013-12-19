
# PRESENTATION ==============================================
inherit UniversMap_P Presentation
method UniversMap_P constructor {control can} {
  this inherited $control
}

# CONTROLLER ================================================
inherit UniversMap Control
method UniversMap constructor {can {parent ""}} {
  UniversMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}





