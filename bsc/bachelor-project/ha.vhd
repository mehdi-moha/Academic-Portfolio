----------------
-- Half Adder --
----------------
ENTITY ha IS
    PORT
    (
        x,y : IN bit;
        result,carry : OUT bit
    );
END ha;

ARCHITECTURE ha_arch OF ha IS
    BEGIN
        result <= x XOR y;
        carry <= x AND y;
    END ha_arch;