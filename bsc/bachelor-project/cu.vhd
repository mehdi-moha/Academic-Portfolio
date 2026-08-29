------------------
-- Control Unit --
------------------
ENTITY cu IS
    PORT
    (
        d : IN bit_vector(7 DOWNTO 0);
        t : IN bit_vector(15 DOWNTO 0);
        b : IN bit_vector(11 DOWNTO 0);
        ac : IN bit_vector(15 DOWNTO 0);
        dr : IN bit_vector(15 DOWNTO 0);
        ir15,cout,q_e,q_i,q_ien,q_fgi,q_fgo,q_r : IN bit;
        s : OUT bit_vector(2 DOWNTO 0);
        clr_ar,ld_ar,inr_ar : OUT bit;
        clr_pc,ld_pc,inr_pc : OUT bit;
        ld_dr,inr_dr : OUT bit;
        clr_ac,ld_ac,inr_ac : OUT bit;
        ld_ir : OUT bit;
        ld_tr : OUT bit;
        rm,wm : OUT bit;
        ld_outr : OUT bit;
        clr_sc,inr_sc : OUT bit;
        j_e,k_e,reset_e,set_e,j_i,k_i,j_ien,k_ien,k_fgi,k_fgo,j_r,k_r,k_s : OUT bit;
        and_op,add_op,dr_op,inpr_op,com_op,shr_op,shl_op : BUFFER bit
    );
END cu;

ARCHITECTURE cu_arch OF cu IS
    COMPONENT encoder IS
        PORT
        (
            a : IN bit_vector(7 DOWNTO 1);
            b : OUT bit_vector(2 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL r,p : bit;
    SIGNAL sig : bit_vector(1 DOWNTO 0);
    SIGNAL x : bit_vector(7 DOWNTO 1);
    BEGIN
        r <= (d(7) AND (NOT q_i)) AND t(3);
        p <= (d(7) AND q_i) AND t(3);
        sig(0) <= (((NOT q_r) AND t(1)) OR (((NOT d(7)) AND q_i) AND t(3))) OR (((d(0) OR d(1)) OR (d(2) OR d(6))) AND t(4));
        sig(1) <= (((q_r AND t(2)) OR (((d(0) OR d(1)) OR (d(2) OR d(5))) AND t(5))) OR (((d(3) OR d(4)) AND t(4)) OR (d(6) AND t(6)))) OR (d(7) AND t(3));

        -- Control Inputs Of Address Register ( AR ) --
        clr_ar <= q_r AND t(0);
        ld_ar <= ((t(0) OR t(2)) AND (NOT q_r)) OR (((NOT d(7)) AND q_i) AND t(3));
        inr_ar <= d(5) AND t(4);

        -- BUS Control ( 1 ) --
        x(1) <= (d(4) AND t(4)) OR (d(5) AND t(5));

        -- Control Inputs Of Program Counter ( PC ) --
        clr_pc <= q_r AND t(1);
        ld_pc <= (d(4) AND t(4)) OR (d(5) AND t(5));
        inr_pc <= (((((NOT q_r) AND t(1)) OR (q_r AND t(2))) OR ((((b(4) AND (NOT ac(15))) OR (b(3) AND ac(15))) OR ((b(2) AND ((((ac(0) OR ac(1)) OR (ac(2) OR ac(3))) OR ((ac(4) OR ac(5)) OR (ac(6) OR ac(7)))) NOR (((ac(8) OR ac(9)) OR (ac(10) OR ac(11))) OR ((ac(12) OR ac(13)) OR (ac(14) OR ac(15)))))) OR (b(1) AND (NOT q_e)))) AND r)) OR (((b(9) AND q_fgi) OR (b(8) AND q_fgo)) AND p)) OR ((d(6) AND t(6)) AND ((((dr(0) OR dr(1)) OR (dr(2) OR dr(3))) OR ((dr(4) OR dr(5)) OR (dr(6) OR dr(7)))) NOR (((dr(8) OR dr(9)) OR (dr(10) OR dr(11))) OR ((dr(12) OR dr(13)) OR (dr(14) OR dr(15))))));

        -- BUS Control ( 2 ) --
        x(2) <= t(0) OR (d(5) AND t(4));

        -- Control Inputs Of Data Register ( DR ) --
        ld_dr <= ((d(0) OR d(1)) OR (d(2) OR d(6))) AND t(4);
        inr_dr <= d(6) AND t(5);

        -- BUS Control ( 3 ) --
        x(3) <= d(6) AND t(6);

        -- Control Inputs Of Accumulator ( AC ) --
        and_op <= d(0) AND t(5);
        add_op <= d(1) AND t(5);
        dr_op <= d(2) AND t(5);
        inpr_op <= p AND b(11);
        com_op <= r AND b(9);
        shr_op <= r AND b(7);
        shl_op <= r AND b(6);
        clr_ac <= r AND b(11);
        ld_ac <= (((and_op OR add_op) OR (dr_op OR inpr_op)) OR (com_op OR shr_op)) OR shl_op;
        inr_ac <= r AND b(5);

        -- BUS Control ( 4 ) --
        x(4) <= (p AND b(10)) OR (d(3) AND t(4));

        -- Control Inputs Of Instruction Register ( IR ) --
        ld_ir <= (NOT q_r) AND t(1);

        -- BUS Control ( 5 ) --
        x(5) <= (NOT q_r) AND t(2);

        -- Control Inputs Of Temporary Register ( TR ) --
        ld_tr <= q_r AND t(0);

        -- BUS Control ( 6 ) --
        x(6) <= q_r AND t(1);

        -- Control Read & Write Inputs Of Memory --
        rm <= sig(0);
        wm <= ((q_r AND t(1)) OR ((d(3) OR d(5)) AND t(4))) OR (d(6) AND t(6));

        -- BUS Control ( 7 ) --
        x(7) <= sig(0);

        -- Control Inputs Of Output Register ( OUTR ) --
        ld_outr <= p AND b(10);

        -- Control Inputs Of Sequence Counter ( SC ) --
        clr_sc <= sig(1);
        inr_sc <= NOT(sig(1));

        -- Control Inputs Of E Flip Flop --
        j_e <= ((d(1) AND t(5)) AND cout) OR (r AND b(8));
        k_e <= (((d(1) AND t(5)) AND (NOT cout)) OR (r AND b(8))) OR (r AND b(10));
        reset_e <= ((r AND b(7)) AND (NOT ac(0))) OR ((r AND b(6)) AND (NOT ac(15)));
        set_e <= ((r AND b(7)) AND ac(0)) OR ((r AND b(6)) AND ac(15));

        -- Control Inputs Of I Flip Flop --
        j_i <= ((NOT q_r) AND t(2)) AND ir15;
        k_i <= ((NOT q_r) AND t(2)) AND (NOT ir15);

        -- Control Inputs Of IEN Flip Flop --
        j_ien <= p AND b(7);
        k_ien <= (q_r AND t(2)) OR (p AND b(6));

        -- Control Inputs Of FGI Flip Flop --
        k_fgi <= p AND b(11);

        -- Control Inputs Of FGO Flip Flop --
        k_fgo <= p AND b(10);

        -- Control Inputs Of R Flip Flop --
        j_r <= (((t(0) OR t(1)) NOR t(2)) AND q_ien) AND (q_fgi OR q_fgo);
        k_r <= t(2) AND q_r;

        -- Control Inputs Of S Flip Flop --
        k_s <= r AND b(0);

        u0 : encoder PORT MAP(x,s);
    END cu_arch;