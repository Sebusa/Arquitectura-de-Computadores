module RegisterUnit(
  output logic [4:0] RU1, RU2, //LED lights 5 each --> original 32 bits
  input logic [2:0] DataWR,//3 buttons. 1 left --> original 32 bits
  input logic [2:0] rs1, rs2, rd, //3 switches each. 1 left --> original 4 bits
  input logic RUWr, clk //RUWr 1 switch. clk 1 button
);
  
  reg[31:0] registers[31:0];
  
  always @(posedge clk)
    begin
  
   	//Input
      
      if(RUWr)
        registers[rd] = DataWR;
    
    //Output
    RU1 = registers[rs1];
    RU2 = registers[rs2];
      
    end
endmodule