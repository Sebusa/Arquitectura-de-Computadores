module InstructionMemoryUnit(
  output [9:0] Instruction, //LED lights. --> original 32 bits
  input [9:0] Address //switches. --> original 32 bits
);
  
  reg[9:0] memory[0:3]; //[0:1024]
  
	initial begin
      $readmemb("instructions.txt",memory);
	end

  assign Instruction = memory[Address]; //W	
	
endmodule