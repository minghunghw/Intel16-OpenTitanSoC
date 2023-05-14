logic tck_en;
   logic [210:0] p_tdi;
   logic [7:0] count;
   initial 
   begin
   //ringpll_tb.dut.ringpll_sip.
	tck_en   = 1'b0;
	p_tdi    = 211'h7_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000; 
	tshiftdr = 1'b0;
	tupdatedr= 1'b0;
	treg_en	 = 1'b0;
	trst_n   = 1'b0;
	
	count 	 = 1'b0;
	tcapturedr	 = 1'b0;
	tdi 		 = 1'b0;
	
	//@(posedge pllen);
	//@(negedge pllen);
	//@(posedge pllen);
	 tck_en = 1'b1;
	
	 #10ps trst_n    	= 1'b1;
	 #5ps treg_en		= 1'b1;
	 #5ps tshiftdr   	= 1'b1;
	 #11.64us tshiftdr  	= 1'b0;
	 #59ns tupdatedr	= 1'b1;
	 #54ns tupdatedr  	= 1'b0;
	 p_tdi    = 211'h0_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
	 #5ps count		= 1'b0;
	 #5ps tshiftdr   	= 1'b1;
	 #10950ns treg_en	= 1'b0;
	 tshiftdr  		= 1'b0;
	 #100ps treg_en		= 1'b1;
	 tcapturedr		= 1'b1;
	 #49ns tcapturedr	= 1'b0;
	 treg_en		= 1'b0;
	
    
     end
    
    	assign tck = tck_en? clkref:1'b0;
   
   	always @(posedge tck)
	begin
	if(count <= 210)
	begin
		tdi 	= p_tdi[count];
		count 	= count+1;
	end
	else
		tdi = 0;
	end
