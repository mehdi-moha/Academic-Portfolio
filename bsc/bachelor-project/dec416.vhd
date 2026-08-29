------------------
-- 4*16 Decoder --
------------------
ENTITY dec416 IS
    PORT
    (
        i : IN bit_vector(3 DOWNTO 0);
        o : OUT bit_vector(15 DOWNTO 0)
    );
END dec416;

ARCHITECTURE dec416_arch OF dec416 IS
    COMPONENT dec12_en IS
        PORT
        (
            a : IN bit;
            en : IN bit;
            b : OUT bit_vector(1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL sig : bit_vector(13 DOWNTO 0);
    SIGNAL one : bit:='1';
    BEGIN
        u0 : dec12_en PORT MAP(i(3),one,sig(1 DOWNTO 0));
        u1 : dec12_en PORT MAP(i(2),sig(0),sig(3 DOWNTO 2));
        u2 : dec12_en PORT MAP(i(2),sig(1),sig(5 DOWNTO 4));
        u3 : dec12_en PORT MAP(i(1),sig(2),sig(7 DOWNTO 6));
        u4 : dec12_en PORT MAP(i(1),sig(3),sig(9 DOWNTO 8));
        u5 : dec12_en PORT MAP(i(1),sig(4),sig(11 DOWNTO 10));
        u6 : dec12_en PORT MAP(i(1),sig(5),sig(13 DOWNTO 12));
        u7 : dec12_en PORT MAP(i(0),sig(6),o(1 DOWNTO 0));
        u8 : dec12_en PORT MAP(i(0),sig(7),o(3 DOWNTO 2));
        u9 : dec12_en PORT MAP(i(0),sig(8),o(5 DOWNTO 4));
        u10 : dec12_en PORT MAP(i(0),sig(9),o(7 DOWNTO 6));
        u11 : dec12_en PORT MAP(i(0),sig(10),o(9 DOWNTO 8));
        u12 : dec12_en PORT MAP(i(0),sig(11),o(11 DOWNTO 10));
        u13 : dec12_en PORT MAP(i(0),sig(12),o(13 DOWNTO 12));
        u14 : dec12_en PORT MAP(i(0),sig(13),o(15 DOWNTO 14));
    END dec416_arch;