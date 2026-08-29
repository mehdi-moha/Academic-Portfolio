---------------------
-- 16 Bit Register --
---------------------
ENTITY sbr IS
    PORT
    (
        clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
        i_in : IN bit_vector(15 DOWNTO 0);
        a_out : OUT bit_vector(15 DOWNTO 0)
    );
END sbr;

ARCHITECTURE sbr_arch OF sbr IS
    COMPONENT nbr IS
        GENERIC(n : integer);
        PORT
        (
            clr,ld,inr,en,clk : IN bit;
            i : IN bit_vector(n-1 DOWNTO 0);
            a : OUT bit_vector(n-1 DOWNTO 0);
            carry_out : OUT bit
        );
    END COMPONENT;
    BEGIN
        u0 : nbr GENERIC MAP(n => 16) PORT MAP(clr_in,ld_in,inr_in,en_in,clk_in,i_in,a_out,OPEN);
    END sbr_arch;