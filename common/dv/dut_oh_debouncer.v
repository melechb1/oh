module dut(/*AUTOARG*/
   // Outputs
   dut_active, wait_out, access_out, packet_out,
   // Inputs
   clk, nreset, vdd, vss, access_in, packet_in, wait_in
   );

   parameter N  = 1;
   parameter PW = 104;
      
   //clock, reset
   input            clk;
   input            nreset;
   input [N*N-1:0]  vdd;
   input 	    vss;
   output 	    dut_active;
   
   //Stimulus Driven Transaction
   input [N-1:0]     access_in;
   input [N*PW-1:0]  packet_in;
   output [N-1:0]    wait_out;

   //DUT driven transactoin
   output [N-1:0]    access_out;
   output [N*PW-1:0] packet_out;
   input [N-1:0]     wait_in;

   /*AUTOINPUT*/
   /*AUTOOUTPUT*/
   /*AUTOWIRE*/
    

   //tie offs for Dv
   assign dut_active   = 1'b1;
   assign wait_out     = 1'b0;
   
   
   oh_debouncer #(.CLKPERIOD(10))   
   oh_debouncer (.clean_out  (clean_out),
		 .nreset     (nreset),
		 .clk	     (clk),
		 .noisy_in   (packet_in[PW-1])
		 );
   
endmodule // dv_elink
// Local Variables:
// verilog-library-directories:("." "../hdl" "../../emesh/dv" "../../emesh/hdl")
// End:

