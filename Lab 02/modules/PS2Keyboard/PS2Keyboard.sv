module PS2Keyboard(clk,Data,Ascii);
  input clk, Data;
  output reg[7:0] Ascii;

//Inicializando Registros
  reg[3:0] counter;
  reg[7:0] currentData;
  reg[7:0] previewData;
  reg flag;

  reg[7:0] out;
  assign Ascii = out;
  
initial begin
	counter = 4'b1;
	currentData = 8'b0;
	previewData = 8'b0;
	flag = 1'b0;
	Ascii = 8'b0;
end

  always @(negedge clk) begin //Teclado en activo bajo acorde al pulso del reloj
	case (counter)
		1:; //Bit inicial
		2: 	currentData[0] <= Data;
		3: 	currentData[1] <= Data;	
		4: 	currentData[2] <= Data;
		5: 	currentData[3] <= Data;	
		6: 	currentData[4] <= Data;
		7: 	currentData[5] <= Data;	
		8: 	currentData[6] <= Data;
		9: 	currentData[7] <= Data;
		10:	flag <= 1'b1;
		11: 	flag <= 1'b0;
	endcase

	if (counter <= 10)
		counter <= counter + 4'b1;
	else 
		counter <= 4'b1;
  end

  always @(posedge flag) begin
		out = currentData;
  end
  
endmodule 