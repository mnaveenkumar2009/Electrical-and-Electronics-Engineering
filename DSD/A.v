/*  
    The following program is executed on the terminal with input from an
    input file and output printed on the terminal. Hence, input and output
    do not have their respective keywords in the declaration.
*/

module main;
    integer i, file, display;
    reg [8:0] input_c; // input as a character read from the file
    reg [3:0]out; // output whose value used to display the led structure

    function [3:0]disp(input [3:0]cur_state);
        integer j, strbit;
        reg[88:0] string; // The LED denoted as a string of 11 characters each line which are 8 bits each
        begin
            $display("State = %0d", cur_state); // print the state
            for(j = 0; j < 3; j++) begin
                assign string = ".. .. .. ..";
                /*
                    Find the position of the LED to light up using the logic obtained from the Truth table.
                    A simplified logic is used in the code below.
                    Notation:
                        Lightend up -   ##
                        Otherwise -     ..
                    Initially all are set to ..
                    Hence, we need to add (("##" - "..") * power(2, starting position))
                    which is equal to (("##" - "..") << starting position)
                */
                if (cur_state >= 4) begin
                    if (j >= 1) begin
                        assign strbit = ((cur_state - 4) * 3) * 8;
                        assign string = string + (("##" - "..") << strbit);
                    end
                end
                if (cur_state < 4) begin
                    if (j <= 1) begin
                        assign strbit = ((3 - cur_state) * 3) * 8;
                        assign string = string + (("##" - "..") << strbit);
                    end
                end
                $display("%s", string); // display the current LED row
            end
            $display(""); // new line
        end
    endfunction

    initial 
        begin
            file = $fopen("input.txt", "r");
            assign out = 0;
            $display("Initially");

            // display the inital LED state
            display = disp(out);

            input_c = $fgetc(file) - 48; // 48 is the ASCII value of '0'
            while (input_c != ('h1ff - 48)) begin
                $display("Input = %d", input_c);
                if (input_c == 1)
                    assign out = (out + 1) % 8; // state increases by 1 and goes anticlockwise
                else
                    assign out = (out + 7) % 8; // state reduces by 1 and goes clockwise

                // display the LED
                display = disp(out);

                // Read new input
                input_c = $fgetc(file) - 48;
            end
            $finish;
        end
endmodule