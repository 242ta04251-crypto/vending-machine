`timescale 1ns / 1ps

module vending_machine_tb;

reg clk;
reg reset;
reg coin5;
reg coin10;

wire dispense;
wire change;

vending_machine uut(
    .clk(clk),
    .reset(reset),
    .coin5(coin5),
    .coin10(coin10),
    .dispense(dispense),
    .change(change)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    coin5 = 0;
    coin10 = 0;

    #10 reset = 0;

    // ₹5
    #10 coin5 = 1;
    #10 coin5 = 0;

    // ₹10 -> Dispense
    #10 coin10 = 1;
    #10 coin10 = 0;

    // ₹10
    #20 coin10 = 1;
    #10 coin10 = 0;

    // ₹10 -> Dispense + Change
    #10 coin10 = 1;
    #10 coin10 = 0;

    #30 $finish;
end

initial
begin
    $display("Time\tCoin5\tCoin10\tDispense\tChange");
    $monitor("%0t\t%b\t%b\t%b\t\t%b",
              $time, coin5, coin10, dispense, change);
end

endmodule

