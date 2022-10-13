localparam SPI_CLK_PERIOD = 100;

`define SPI_TX(cycle, pattern)              \
    for (int i=cycle-1; i>=0; i--) begin    \
        spi_sdi0 = pattern[i];              \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b1;                    \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b0;                    \
    end                                     

`define SPI_RX(cycle, pattern)              \
    for (int i=cycle-1; i>=0; i--) begin    \
        pattern[i] = spi_sdo0;              \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b1;                    \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b0;                    \
    end                                     \
    rd_data_valid = 1'b1;                   \
    #SPI_CLK_PERIOD;                        \
    rd_data_valid = 1'b0;                                       

`define DUMMY_CYCLE                         \
    for (int i=0; i<34; i++) begin          \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b1;                    \
        #SPI_CLK_PERIOD;                    \
        spi_sclk = 1'b0;                    \
    end                                       

`define SPI_OUTPUT(cmd, addr, data)         \
    spi_cs = 0;                             \
    #SPI_CLK_PERIOD;                        \
    `SPI_TX(8, cmd);                        \
    `SPI_TX(32, addr);                      \
    `SPI_TX(32, data);                      \
    #SPI_CLK_PERIOD;                        \
    spi_cs = 1;                             

`define SPI_INPUT(cmd, addr, data)          \
    spi_cs = 0;                             \
    #SPI_CLK_PERIOD;                        \
    `SPI_TX(8, cmd);                        \
    `SPI_TX(32, addr);                      \
    `DUMMY_CYCLE;                           \
    `SPI_RX(32, data);                      \
    #SPI_CLK_PERIOD;                        \
    spi_cs = 1;                             
