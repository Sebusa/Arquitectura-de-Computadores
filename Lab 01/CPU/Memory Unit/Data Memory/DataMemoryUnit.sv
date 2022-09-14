module DataMemoryUnit(
  input logic[3:0] Address,DataWr, //4 switches each. [31:0]
  input logic DMWr, //1 switch
  input logic[2:0] DMCtrl, //3 push buttons
  output logic [3:0] DataRd //41| LED lights. [31:0]
);
  
  reg[3:0] Memory[3:0];
  
  always @(Address) begin
    //Write-------------------------------------------------------------------------------------
    if(DMWr) begin
      
      case(DMCtrl) //Ctrl Write
		
		/*
		[7:0] -->[0]
		[15:0] --> [1:0]
		[31:8] --> [3:1]
		[31:16] --> [3:2]
		[31:24] -> [3]
		[23:0] --> [2:0]
		[15:8] --> [1]
		
		*/
      
        3'b000 | 3'b100: begin //>>2
          case (Address[1:0]) //Byte
			 
            0: Memory[Address] = {Memory[Address][3:1], DataWr[0]};
            1: Memory[Address] = {Memory[Address][3:2], DataWr[0],Memory[Address][3]};
            2: Memory[Address] = {Memory[Address][3], DataWr[0],Memory[Address][1:0]};
            3: Memory[Address] = {DataWr[0], Memory[Address][2:0]};
          endcase
        end
            
        3'b001 | 3'b101: begin //Half
          case (Address[1]) 
            0: Memory[Address] = {Memory[Address][3:2], DataWr[1:0]};
            1: Memory[Address] = {DataWr[1:0],Memory[Address][1:0]};
          endcase
        end
            
        3'b010: begin //Word
          Memory[Address] = DataWr;
        end
      
      endcase
    end
      
    //Read--------------------------------------------------------------------------------------
      case(DMCtrl) 
        
        3'b000: begin //Byte Signed 
          case(Address[1:0])
            0:  DataRd <= {3'b1,Memory[Address][0]};    //extension de signo binario
            1:  DataRd <= {3'b1,Memory[Address][1]};
            2:  DataRd <= {3'b1,Memory[Address][2]};
            3:  DataRd <= {3'b1,Memory[Address][3]};
          endcase
        end

        3'b100: begin //Byte Unsigned 
          case(Address[1:0])
            0:  DataRd = {3'b0,Memory[Address][0]};    //extension de ceros
            1:  DataRd = {3'b0,Memory[Address][1]};
            2:  DataRd = {3'b0,Memory[Address][2]};
            3:  DataRd = {3'b0,Memory[Address][3]};
          endcase
        end

        3'b001: begin //Half Signed 
          case(Address[1])
            0:DataRd = {2'b1,Memory[Address][1:0]};	//extension de signo binario
            1:DataRd = {2'b1,Memory[Address][3:2]}; 
          endcase
        end
        
        3'b101: begin //Half Unsigned
          case(Address[1])
            0:DataRd = {2'b0,Memory[Address][1:0]};	//extension de ceros
            1:DataRd = {2'b0,Memory[Address][3:2]}; 
          endcase
        end
        
        3'b010:  DataRd = Memory[Address]; //Word
      
      endcase
  
  end
endmodule