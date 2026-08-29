--------------------
-- n Bit Register --
--------------------
ENTITY nbr IS
    GENERIC(n : integer);
    PORT
    (
        clr,ld,inr,en,clk : IN bit;
        i : IN bit_vector(n-1 DOWNTO 0);
        a : OUT bit_vector(n-1 DOWNTO 0);
        carry_out : OUT bit
    );
END nbr;

ARCHITECTURE nbr_arch OF nbr IS
    COMPONENT rc IS
        PORT
        (
            inp_2,inp_1,inp_0,en,ck,i : IN bit;
            a : OUT bit;
            c : OUT bit
        );
    END COMPONENT;
    SIGNAL c : bit_vector(n-2 DOWNTO 0);
    SIGNAL sig : bit_vector(1 DOWNTO 0);
    BEGIN
        sig(0) <= (NOT clr) AND ld;
        sig(1) <= ((NOT clr) AND (NOT ld)) AND inr;
        u0 : rc PORT MAP(sig(1),sig(0),clr,en,clk,i(0),a(0),c(0));
        generate_loop0 : FOR j IN 1 TO n-2 GENERATE
            uj : rc PORT MAP(c(j-1),sig(0),clr,en,clk,i(j),a(j),c(j));
        END GENERATE;
        unm1 : rc PORT MAP(c(n-2),sig(0),clr,en,clk,i(n-1),a(n-1),carry_out);
    END nbr_arch;