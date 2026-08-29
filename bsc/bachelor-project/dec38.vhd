-----------------
-- 3*8 Decoder --
-----------------
ENTITY dec38 IS
    PORT
    (
        i : IN bit_vector(2 DOWNTO 0);
        o : OUT bit_vector(7 DOWNTO 0)
    );
END dec38;

ARCHITECTURE dec38_arch OF dec38 IS
    COMPONENT dec12_en IS
        PORT
        (
            a : IN bit;
            en : IN bit;
            b : OUT bit_vector(1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL sig : bit_vector(5 DOWNTO 0);
    SIGNAL one : bit:='1';
    BEGIN
        u0 : dec12_en PORT MAP(i(2),one,sig(1 DOWNTO 0));
        u1 : dec12_en PORT MAP(i(1),sig(0),sig(3 DOWNTO 2));
        u2 : dec12_en PORT MAP(i(1),sig(1),sig(5 DOWNTO 4));
        u3 : dec12_en PORT MAP(i(0),sig(2),o(1 DOWNTO 0));
        u4 : dec12_en PORT MAP(i(0),sig(3),o(3 DOWNTO 2));
        u5 : dec12_en PORT MAP(i(0),sig(4),o(5 DOWNTO 4));
        u6 : dec12_en PORT MAP(i(0),sig(5),o(7 DOWNTO 6));
    END dec38_arch;