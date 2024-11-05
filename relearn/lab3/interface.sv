`include "data_define.v"
interface top_if(input bit clock);
    parameter reg_wd = `REGISTER_WIDTH;
    //input DUT
    logic                   reset;
    logic                   enable_ex;
    logic [reg_wd - 1:0]    src1, src2;
    logic [reg_wd - 1:0]    imm;
    logic [6:0]             control_in;
    logic [reg_wd - 1:0]    mem_data_read_in;
    //output DUT
    logic                   mem_data_wr_en;
    logic [reg_wd - 1:0]    mem_data_write_out;
    logic [reg_wd - 1:0]    aluout;
    logic                   carry;

/*clocking block tao ra de dong bo giao tiep giua testbench va DUT dua tren xung clock.
vi vay, trong testbench, src1, scr2,... la output vi testbench can dieu khien cac tin hieu nay de dua vao DUT
*/
    clocking cb @(posedge clk);
        default input #1 output #1; //dung trong clocking block(cb) de dat do tre mac dinh cho tat ca cac tin hieu input va output trong clocking block 
        output      enable_ex;
        output      src1, src2;
        output      imm;
        output      control_in;
        output      mem_data_read_in;

        input       mem_data_wr_en;
        input       mem_data_write_out;
        input       aluout;
        input       carry;
    endclocking

    modport TB (input clocking cb, output reset); //testbench(TB) se co quyen truy cap vao clocking block(cb) va co the dieu khien tin hieu reset nhu mot tin hieu output
endinterface