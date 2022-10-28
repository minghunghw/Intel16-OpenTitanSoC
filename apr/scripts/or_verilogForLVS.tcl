#--------------------------------------------------------------------------------
# This script insert DUMMY EXLUCDE layers for core area into the top cell of the 
# input GDS.
# This script perform the following to the input verilog file
#     remove "_mod" from macro name being instantiated
#     remove empty subckt being instantiated
#
# Application: OpenROAD
# Input:       env(TECH_LEF)           - technology LEF file
#              env(SC_LEF)             - standard cell LEF
#              env(ADDITIONAL_LEFS)    - additional LEF: IP, io's, ....
#              env(FINAL_V)            - final verilog to be used for Calibee LVS
#              env(CALIBRE_V)          - Calibre LVS verilog file (output)    
# Arthur:      XiCret Services, Inc
#--------------------------------------------------------------------------------
puts "\[INFO\] Verilog modifier for Calibre LVS"
puts "\[INFO\] Reading LEF files"
if {![info exists standalone] || $standalone} {
  # Read lef
  read_lef $::env(TECH_LEF)
  read_lef $::env(SC_LEF)
  if {[info exist ::env(ADDITIONAL_LEFS)]} {
    foreach lef $::env(ADDITIONAL_LEFS) {
      read_lef $lef
    }
  }
}

#--------------------------------------------------------------------------------
set verilogFile $::env(FINAL_V)
set outputVerilogFile $::env(CALIBRE_V)

#--------------------------------------------------------------------------------
# create list of empty subckt
array set emptyCKT [list]

foreach ckt [list CDMMTYPE2_32422 \
                  CNRCAPNWOUTTIE12_A9PP84TR_C14 \
                  ENDCAPTIE12_A9PP84TR_C14 \
                  FILL128_A9PP84TR_C14 \
                  FILL16_A9PP84TR_C14 \
                  FILL2_A9PP84TR_C14 \
                  FILL32_A9PP84TR_C14 \
                  FILL3_A9PP84TR_C14 \
                  FILL4_A9PP84TR_C14 \
                  FILL64_A9PP84TR_C14 \
                  FILL8_A9PP84TR_C14 \
                  FILLTIE11_A9PP84TR_C14 \
                  IN12LP_GPIO18_13M9S30P_48X84_LB_STAG \
                  IN12LP_GPIO18_13M9S30P_BRK_V \
                  IN12LP_GPIO18_13M9S30P_CORNER \
                  IN12LP_GPIO18_13M9S30P_CTRL_BRK_H \
                  IN12LP_GPIO18_13M9S30P_CTRL_BRK_V \
                  IN12LP_GPIO18_13M9S30P_FILL10_H \
                  IN12LP_GPIO18_13M9S30P_FILL1_H \
                  IN12LP_GPIO18_13M9S30P_FILL1_V \
                  IN12LP_GPIO18_13M9S30P_FILL20_H \
                  IN12LP_GPIO18_13M9S30P_FILL20_V \
                  IN12LP_GPIO18_13M9S30P_FILL5_H \
                  IN12LP_GPIO18_13M9S30P_FILL5_V \
                  INCNRCAPNWINTIE12_A9PP84TR_C14 \
                  INCNRCAPNWOUTTIE12_A9PP84TR_C14 \
                  TBCAPNWIN2_A9PP84TR_C14 \
                  TBCAPNWIN3_A9PP84TR_C14 \
                  TBCAPNWINTIE16_A9PP84TR_C14 \
                  TBCAPNWOUT2_A9PP84TR_C14 \
                  TBCAPNWOUT3_A9PP84TR_C14 \
                  TBCAPNWOUTTIE16_A9PP84TR_C14] {
  set emptyCKT($ckt) $ckt
}

#--------------------------------------------------------------------------------
puts "\[INFO\] Prepare netlist for LVS"
puts "\[INFO\]   input verilog  $verilogFile"
puts "\[INFO\]   output verilog $outputVerilogFile"
puts "\[INFO\] Remove _mod"
puts "\[INFO\] Remove empty CKT instantiation"

set db [::ord::get_db]
set tech [$db getTech]

array set cellList [list]
set libList [lindex [$db getLibs] 0]
foreach l $libList {
  foreach cell [$l getMasters] {
    set cellName [$cell getName]
    foreach t [$cell getMTerms] {
      if { [$t getName] == "VNW" } {
        if { ! [info exists cellList($cellName)] } {
          set cellList($cellName) $cellName
          break
        }
      }
    }
  }
}

set V [open $verilogFile]
set vContent [read $V]
close $V
set V [open $outputVerilogFile "w"]

set FS ""
foreach line [split $vContent ";"] {
  set cell [lindex $line 0]  
  set newline $line
  if { [info exists emptyCKT($cell)] } {
    set newline ""
    set FS ""
  } elseif { [regexp {_mod} $cell] } {
    set newCell [regsub {_mod} $cell ""]
    set newline [regsub $cell $line $newCell]
  }
  puts -nonewline $V "${FS}${newline}"
  set FS ";"
}

close $V
