if {[info exists ::env(PRS_FILL)]} {
    puts "Insert blockage for prsfill cells placement at (0,0) (58.32 57.96)"
    odb::dbBlockage_create [ord::get_db_block] 32400 35280 149040 151200
    puts "Insert obstruction for prsfill cells routing at (0,0) (58.32 57.96)"
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m1] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m2] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m3] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m4] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m5] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m6] 32400 35280 149040 151200
    odb::dbObstruction_create [ord::get_db_block] [[ord::get_db_tech] findLayer m7] 32400 35280 149040 151200
}