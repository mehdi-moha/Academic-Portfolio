---------------------
-- 12 Bit Register --
---------------------
ENTITY tbr IS
    PORT
    (
        clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
        i_in : IN bit_vector(11 DOWNTO 0);
        a_out : OUT bit_vector(11 DOWNTO 0)
    );
END tbr;

ARCHITECTURE tbr_arch OF tbr IS
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
        u0 : nbr GENERIC MAP(n => 12) PORT MAP(clr_in,ld_in,inr_in,en_in,clk_in,i_in,a_out,OPEN);
    END tbr_arch;