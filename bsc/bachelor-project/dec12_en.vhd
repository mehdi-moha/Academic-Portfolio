-----------------------------------
-- 1*2 Decoder With Enable Input --
-----------------------------------
ENTITY dec12_en IS
    PORT
    (
        a : IN bit;
        en : IN bit;
        b : OUT bit_vector(1 DOWNTO 0)
    );
END dec12_en;

ARCHITECTURE dec12_en_arch OF dec12_en IS
    BEGIN
        b(0) <= (NOT a) AND en;
        b(1) <= a AND en;
    END dec12_en_arch;