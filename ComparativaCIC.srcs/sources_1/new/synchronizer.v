//! @title Synchronizer
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1.0
//! @date 10/11/22
//! @brief 2 stages of FF to syncronize an async input (Asynchronous assertion and Synchronous deassertion)
//! Uses FDPE primitive: D Flip-Flop with Asynchronous Preset and Clock Enable

`timescale 1ns / 1ps

module synchronizer
    (
    sync_out,     
    async_in,     
    clk     

    );

    output          sync_out;       //! Synchronous output
    input           async_in;       //! Asynchronous input
    input           clk;            //! System clock

    (* ASYNC_REG = "TRUE" *) reg     reg1;
    (* ASYNC_REG = "TRUE" *) reg     reg2;
 
    always @ (posedge clk or posedge async_in)
        begin
        if(async_in)
            begin
            reg1     <= 1'b1;
            reg2     <= 1'b1;
            end
        else
            begin
            reg1     <= 1'b0;
            reg2     <= reg1;
            end
        end

    assign          sync_out = reg2;

endmodule
