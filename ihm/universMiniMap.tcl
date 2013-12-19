# PRESENTATION ==============================================
inherit UniversMiniMap_P Presentation
method UniversMiniMap_P constructor {control can} {
  this inherited $control
}

# CONTROLLER ================================================
inherit UniversMiniMap Control
method UniversMiniMap constructor {can {parent ""}} {
  UniversMiniMap_P ${objName}_P $objName $can
  this inherited $parent "" ${objName}_P ""
}





