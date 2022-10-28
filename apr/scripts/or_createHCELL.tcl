#--------------------------------------------------------------------------------
# This script create HCELL list file for Calibre LVS.
# The cell list are obtained from DEF files.
#
# Application: OpenROAD
# Input:       env(TECH_LEF)           - technology LEF file
#              env(SC_LEF)             - standard cell LEF
#              env(ADDITIONAL_LEFS)    - additional LEF: IP, io's, ....
#              env(FINAL_DEF)          - final DEF
#              env(CALIBRE_HCELL)      - Calibre LVS HCELL list file (output)    
# Arthur:      XiCret Services, Inc
#--------------------------------------------------------------------------------
if {![info exists standalone] || $standalone} {
  # Read lef
  read_lef $::env(TECH_LEF)
  read_lef $::env(SC_LEF)
  if {[info exist ::env(ADDITIONAL_LEFS)]} {
    foreach lef $::env(ADDITIONAL_LEFS) {
      read_lef $lef
    }
  }

  # Read design files
  read_def $::env(FINAL_DEF)
}

#--------------------------------------------------------------------------------
puts "\[INFO\] Creating HCELL List $::env(CALIBRE_HCELL)"
set db [::ord::get_db]
set block [[$db getChip] getBlock]
set tech [$db getTech]

array set cellList [list]
foreach inst [$block getInsts] {
  set cell [[$inst getMaster] getName]
  if { ! [info exists cellList($cell)] } {
    set cellList($cell) $cell
  }
}

set hcell [open $::env(CALIBRE_HCELL) w]
foreach cell [lsort [array names cellList]] {
  regsub {_mod} $cell {} name
  puts $hcell "$name $name"
}
close $hcell

