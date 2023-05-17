module SPI_SLAVE#(parameter DATA_WIDTH =96 )(
    input   wire                        clk         ,
    input   wire                        rst_n       ,
    input   wire                        mosi        ,
    input   wire                        sclk        ,
    input   wire                        tx_finish   ,
    input   wire                        start       ,
    input   wire                        ss_n        ,

    output  wire    [DATA_WIDTH-1:0]   data_o      ,
    //output  wire                        miso        ,
    output  wire                        r_finish
);
    parameter       IDLE    =   4'b0001     ,
                    RV_DATA =   4'b0010     ,
                    FINISH  =   4'b0100     ;

    wire                        sclk_posedge        ;
    wire                        sclk_negedge        ;
    wire                        dec_pos_or_neg_sample;


    reg                         sclk_dly            ;
    reg     [DATA_WIDTH-1:0]   data_shift_pos      ;
    reg     [DATA_WIDTH-1:0]   data_shift_neg      ;
    reg     [3:0]               state               ;
    reg     [3:0]               nx_state            ;
    reg     [6:0]               cnt_sclk_pos        ;
    reg     [6:0]               cnt_sclk_neg        ;
    wire    [6:0]               num_sample_data     ;

    assign  sclk_posedge = ((sclk == 1'b1) && (sclk_dly == 1'b0)) ? 1'b1 : 1'b0;
    assign  sclk_negedge = ((sclk == 1'b0) && (sclk_dly == 1'b1)) ? 1'b1 : 1'b0;
    assign  dec_pos_or_neg_sample = 1'b1;

    assign  num_sample_data = (dec_pos_or_neg_sample) ? cnt_sclk_pos : cnt_sclk_neg;
    
    always @(posedge clk or negedge rst_n) begin
        sclk_dly <= sclk;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= IDLE;
        end
        else begin
            state <= nx_state;
        end
    end

    always @(*) begin
        nx_state <= IDLE;
        case(state)
            IDLE: nx_state <= start ? RV_DATA :IDLE;
            RV_DATA: begin
                if((num_sample_data == 7'd95) && (dec_pos_or_neg_sample) && (sclk_posedge) && (!ss_n)) begin
                    nx_state <= FINISH;
                end
                else if((num_sample_data == 7'd95) && (~dec_pos_or_neg_sample) && (sclk_negedge) && (!ss_n)) begin
                    nx_state <= FINISH;
                end
                else begin
                    nx_state <= RV_DATA;
                end
            end
            FINISH: nx_state <= IDLE;
        endcase
    end


    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            cnt_sclk_pos <= 7'd0;
        end
        else if((state == FINISH)) begin
            cnt_sclk_pos <= 7'd0;
        end
        else if(sclk_posedge) begin
            cnt_sclk_pos <= cnt_sclk_pos + 1'b1;
        end
        else begin
            cnt_sclk_pos <= cnt_sclk_pos;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            cnt_sclk_neg <= 7'd0;
        end
        else if (state == FINISH) begin
            cnt_sclk_neg <= 7'd0;
        end
        else if (sclk_negedge) begin
            cnt_sclk_neg <= cnt_sclk_neg + 1'b1;
        end
        else begin
            cnt_sclk_neg <= cnt_sclk_neg;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_shift_pos <= {DATA_WIDTH{1'b0}};
        end
        else if((state == RV_DATA) && (sclk_posedge)) begin
            data_shift_pos <= {mosi, data_shift_pos[DATA_WIDTH-1:1]};
        end
        else if (state == FINISH) begin
            data_shift_pos <= {DATA_WIDTH{1'b0}};
        end
        else begin
            data_shift_pos <= data_shift_pos;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_shift_neg <= {DATA_WIDTH{1'b0}};
        end
        else if((state == RV_DATA) && (sclk_negedge)) begin
            data_shift_neg <= {mosi, data_shift_neg[DATA_WIDTH-1:1]};
        end
        else if(state == FINISH) begin
            data_shift_neg <= {DATA_WIDTH{1'b0}};
        end
        else begin
            data_shift_neg <= data_shift_neg;
        end
    end

    //assign data_o = dec_pos_or_neg_sample ? data_shift_pos : data_shift_neg;

    assign  data_o = (state == FINISH) ? (dec_pos_or_neg_sample ? data_shift_pos : data_shift_neg): {DATA_WIDTH{1'b0}};
    assign  r_finish = (state == FINISH); 




endmodule
