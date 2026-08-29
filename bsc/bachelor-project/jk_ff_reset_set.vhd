--------------------------------------------
-- JK Flip Flop With Reset And Set Inputs --
--------------------------------------------
ENTITY jk_ff_reset_set IS
    PORT
    (
        j,k,reset,set,clock : IN bit;
        q : OUT bit
    );
END jk_ff_reset_set;

ARCHITECTURE jk_ff_reset_set_arch OF jk_ff_reset_set IS
    SIGNAL qint : bit;
    BEGIN
        q <= qint;
        PROCESS(reset,set,clock)
            BEGIN
                IF (reset='1' AND set='0') THEN
                    qint <= '0';
                ELSIF (reset='0' AND set='1') THEN
                    qint <= '1';
                ELSIF (clock'event AND clock='1') THEN
                    qint <= (j AND (NOT qint)) OR ((NOT k) AND qint);
                END IF;
            END PROCESS;
    END jk_ff_reset_set_arch;