`timescale 1ns/1ns

`define CLK @(posedge pclk)

module apb_slave_tb ();
  
  logic 			pclk;
  logic 			preset_n; 	// Active low reset
 
  logic[1:0]		add_i;		// 2'b00 - NOP, 2'b01 - READ, 2'b11 - WRITE
  
  logic 			psel_o;
  logic 			penable_o;
  logic [31:0]	paddr_o;
  logic			pwrite_o;
  logic [31:0] 	pwdata_o;
  logic [31:0]	prdata_i;
  logic			pready_i;
  
  // Implement clock
  always begin
    pclk = 1'b0;
    #5;
    pclk = 1'b1;
    #5;
  end
  
  // Instantiate the RTL
  apb_add_master APB_MASTER (
    .pclk(pclk),
    .preset_n(preset_n),
    .add_i(add_i),
    .psel_o(psel_o),
    .penable_o(penable_o),
    .paddr_o(paddr_o),
    .pwrite_o(pwrite_o),
    .pwdata_o(pwdata_o),
    .prdata_i(prdata_i),
    .pready_i(pready_i)
  );
  
  // Drive stimulus
  initial begin
    preset_n = 1'b0;
    add_i = 2'b00;
    repeat (4) `CLK;
    preset_n = 1'b1;
    repeat (4) `CLK;
    
    // Initiate a read transaction
    add_i = 2'b01;
    `CLK;
    add_i = 2'b00;
    repeat (4) `CLK;
    
    // Initiate a write transaction
    add_i = 2'b11;
    `CLK;
    add_i = 2'b00;
    repeat (4) `CLK;
    $finish();
  end
  
  // APB Slave
   always_ff @(posedge pclk or negedge preset_n) begin
    if (~preset_n)
      pready_i <= 1'b0;
    else begin
      if (psel_o && penable_o) begin
        pready_i <= 1'b1;
        prdata_i <= $urandom % 32'h20;  // Set prdata_i to a specific value (e.g., 15)
      end else begin
        pready_i <= 1'b0;
        prdata_i <= $urandom % 32'hFF; // Default value set to a specific value below 20 (e.g., 10)
      end
    end
  end
  
  // VCD Dump
  initial begin
    $dumpfile("apb_master.vcd");
    $dumpvars(2, apb_slave_tb);
  end
  
endmodule
