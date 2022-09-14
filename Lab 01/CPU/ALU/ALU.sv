// ALU
module ALU(
  output logic [9:0]ALURes, //LED lights --> original 32 bits
  input logic  [3:0]A,B, //Switches 4 each. 2 left --> original 32 bits
  input logic [3:0]ALUOp, //Buttons
  input logic en //switch. 1 left?
           );
  
  always@(en,ALUOp,A,B,ALURes)
    
 begin
    
   if(en == 0)
    ALURes = 10'bzzzz; //10 LED lights
else
    case(ALUOp)
      4'b0000: ALURes = A+B;
      4'b1000: ALURes = A-B;
      4'b0001: ALURes = A << B;
      4'b0010: ALURes = $signed(A) < $signed(B);
      4'b0011: ALURes = A < B;
      4'b0100: ALURes = A ^ B;
      4'b0101: ALURes = A >> B;
      4'b1101: ALURes = A >>> B;
      4'b0110: ALURes = A | B;
      4'b0111: ALURes = A & B;
    endcase
end
endmodule