-------------------------------
-- Encoder For BUS Selection --
-------------------------------
ENTITY encoder IS
    PORT
    (
        a : IN bit_vector(7 DOWNTO 1);
        b : OUT bit_vector(2 DOWNTO 0)
    );
END encoder;

ARCHITECTURE encoder_arch OF encoder IS
    BEGIN
        b(0) <= (a(1) OR a(3)) OR (a(5) OR a(7));
        b(1) <= (a(2) OR a(3)) OR (a(6) OR a(7));
        b(2) <= (a(4) OR a(5)) OR (a(6) OR a(7));
    END encoder_arch;