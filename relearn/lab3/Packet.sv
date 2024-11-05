`include "data_define.sv"

class Packet;
    // random input 
    rand reg [`REGISTER_WIDTH - 1:0]    src1;
    rand reg [`REGISTER_WIDTH - 1:0]    src2;
    rand reg [`REGISTER_WIDTH - 1:0]    imm;
    rand reg [`REGISTER_WIDTH - 1:0]    mem_data;
    rand reg                            immp_regn_op_gen;
    rand reg [2:0]                      operation_gen;
    rand reg [2:0]                      opselect_gen;

    reg                                 enable;
    string                              name; // ten

    constraint Limit{
        src1 inside {[0:65534]};
        src2 inside {[0:65534]};
        imm inside {[0:65534]};
        mem_data inside {[0:65534]};
        opselect_gen inside {[0:1], [4:5]}; //opselect_gen chi nhan 1 trong cac gia tri 0, 1, 4, 5

        if(operation_gen == `ARITH_LOGIC) begin
            operation_gen inside {[0:7]};
        end
        else if(operation_gen == `SHIFT_REG) begin
            immp_regn_op_gen inside {0};
            operation_gen inside {[0:3]};
        end
        else if(operation_gen == `MEM_READ) begin
            immp_regn_op_gen inside {1};
            operation_gen inside {[0:4]};
        end
        else if(operation_gen == `MEM_WRITE) begin
            immp_regn_op_gen inside {1};
            operation_gen inside {[0:7]};
        end
    }
    extern function new(string name = "Packet");
endclass

function Packet :: new(string name);
    this.name = name;
endfunction