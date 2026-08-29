----------------
-- 16 Bit ALU --
----------------
ENTITY sba IS
    PORT
    (
        and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in : IN bit;
        ac : IN bit_vector(15 DOWNTO 0);
        dr : IN bit_vector(15 DOWNTO 0);
        inpr : IN bit_vector(7 DOWNTO 0);
        q_e : IN bit;
        o : OUT bit_vector(15 DOWNTO 0);
        carry_out : OUT bit
    );
END sba;

ARCHITECTURE sba_arch OF sba IS
    COMPONENT oba IS
        PORT
        (
            and_op,add_op,dr_op,inpr_op,com_op,shr_op,shl_op : IN bit;
            ac_i,ac_im1,ac_ip1,dr_i,inpr_i,c_im1 : IN bit;
            c_i,o_i : OUT bit
        );
    END COMPONENT;
    SIGNAL c : bit_vector(14 DOWNTO 0);
    SIGNAL zero : bit:='0';
    BEGIN
        u0 : oba PORT MAP(and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in,ac(0),q_e,ac(1),dr(0),inpr(0),zero,c(0),o(0));
        generate_loop0 : FOR i IN 1 TO 7 GENERATE
            ui : oba PORT MAP(and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in,ac(i),ac(i-1),ac(i+1),dr(i),inpr(i),c(i-1),c(i),o(i));
        END GENERATE;
        generate_loop1 : FOR j IN 8 TO 14 GENERATE
            uj : oba PORT MAP(and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in,ac(j),ac(j-1),ac(j+1),dr(j),ac(j),c(j-1),c(j),o(j));
        END GENERATE;
        u15 : oba PORT MAP(and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in,ac(15),ac(14),q_e,dr(15),ac(15),c(14),carry_out,o(15));
    END sba_arch;