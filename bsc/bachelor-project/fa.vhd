----------------
-- Full Adder --
----------------
ENTITY fa IS
    PORT
    (
        a,b,carry_in : IN bit;
        sum,carry_out : OUT bit
    );
END fa;

ARCHITECTURE fa_arch OF fa IS
    COMPONENT ha IS
        PORT
        (
            x,y : IN bit;
            result,carry : OUT bit
        );
    END COMPONENT;
    SIGNAL sig : bit_vector(2 DOWNTO 0);
    BEGIN
        u0 : ha PORT MAP(a,b,sig(0),sig(1));
        u1 : ha PORT MAP(sig(0),carry_in,sum,sig(2));
        carry_out <= sig(2) OR sig(1);
    END fa_arch;