/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Chukin_Hassan_Korycki (
    input  wire [7:0] ui_in,       // Dedicated inputs
    output wire [7:0] uo_out,      // Dedicated outputs
    input  wire [7:0] uio_in,      // IOs: Input path
    output wire [7:0] uio_out,     // IOs: Output path
    output wire [7:0] uio_oe,      // IOs: Enable path (active high)
    input  wire        ena,         // Enable signal
    input  wire        clk,         // Clock
    input  wire        rst_n,       // Reset (active low)
    input  wire [15:0] test_in     // Input for priority encoder
);

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  priority_encoder encoder (
    .in(test_in),
    .out(uo_out)
  );

endmodule

module priority_encoder (
    input  wire [15:0] in,    // Input
    output reg  [7:0] out     // Output
);

  always @(*) begin
    if (in == 16'b0) begin
      out = 8'b11110000;  // Special case: all zeros
    end else begin
      out = 8'b0;
      if (in[15]) out = 8'd15;
      else if (in[14]) out = 8'd14;
      else if (in[13]) out = 8'd13;
      else if (in[12]) out = 8'd12;
      else if (in[11]) out = 8'd11;
      else if (in[10]) out = 8'd10;
      else if (in[9]) out = 8'd9;
      else if (in[8]) out = 8'd8;
      else if (in[7]) out = 8'd7;
      else if (in[6]) out = 8'd6;
      else if (in[5]) out = 8'd5;
      else if (in[4]) out = 8'd4;
      else if (in[3]) out = 8'd3;
      else if (in[2]) out = 8'd2;
      else if (in[1]) out = 8'd1;
      else if (in[0]) out = 8'd0;
    end
  end

endmodule
