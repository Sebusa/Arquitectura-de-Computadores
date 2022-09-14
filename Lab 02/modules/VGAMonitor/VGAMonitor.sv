module VGAMonitor(
  input clk,
  input [2:0]red,green,blue, //RGB Data
  output reg HSync,VSync,
  output [23:0]VGAPixel,
  output VGAclk,VGABlank,VGASync
);

  integer HCounter;
  integer VCounter;

  reg CLK25MHz;
  //reg HSi,VSi;
  reg [23:0]result;

  initial begin 
    HCounter = 0;
    VCounter = 0;
    CLK25MHz = 0;
  end

  always @(negedge clk)
    begin
      CLK25MHz = ~CLK25MHz;
    end

  assign VGABlank = 1;
  assign VGASync = 1;
  assign VGAclk = CLK25MHz;
  assign VGAPixel = result;

  /*
  PULSOS
  HORIZONTAL			VERTICAL
  a = 96				a = 2
  b = 48				b = 33
  c = 640				c = 480
  d = 16				d = 10
  */
  
  always @(posedge CLK25MHz)
    begin
      if (HCounter < 96)
        HSync = 1'b0; 
      else
        HSync = 1'b1; 

      if (VCounter < 2)
        VSync = 1'b0; 
      else
        VSync = 1'b1; 

      if (HCounter < (800)) //Horizontal Pulses: Ha+Hb+Hc+Hd = 96+48+640+16 = 800
        HCounter = HCounter + 1;

      else 
        begin
          HCounter = 0;
          VCounter = VCounter+1;
        end

      if (VCounter > (525)) //Vertical Pulses: Va+Vb+Vc+Vd = 2+33+480+10 = 525
        begin
          HCounter = 0;
          VCounter = 0;
        end
      
      result = (HCounter > (144) && HCounter < (800) && VCounter > (35) && VCounter < (525)) ? {red,{5{1'b0}},green,{5{1'b0}},blue,{5{1'b0}}}:{24{1'b0}}; //Ha+Hb = 144		Va+Vb = 35

      //$display(HCounter, VCounter, Pixel);
    end
endmodule 