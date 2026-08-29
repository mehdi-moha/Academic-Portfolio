-----------------
-- One Bit ALU --
-----------------
ENTITY oba IS
    PORT
    (
        and_op,add_op,dr_op,inpr_op,com_op,shr_op,shl_op : IN bit;
        ac_i,ac_im1,ac_ip1,dr_i,inpr_i,c_im1 : IN bit;
        c_i,o_i : OUT bit
    );
END oba;

ARCHITECTURE oba_arch OF oba IS
    COMPONENT fa IS
        PORT
        (
            a,b,carry_in : IN bit;
            sum,carry_out : OUT bit
        );
    END COMPONENT;
    SIGNAL sum_i : bit;
    BEGIN
        u0 : fa PORT MAP(ac_i,dr_i,c_im1,sum_i,c_i);
        o_i <= (((((and_op AND ac_i) AND dr_i) OR (add_op AND sum_i)) OR ((dr_op AND dr_i) OR (inpr_op AND inpr_i))) OR ((com_op AND (NOT ac_i)) OR (shr_op AND ac_ip1))) OR (shl_op AND ac_im1);
    END oba_arch;