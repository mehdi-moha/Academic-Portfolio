------------------
-- JK Flip Flop --
------------------
ENTITY jk_ff IS
    PORT
    (
        j,k,clock : IN bit;
        q : OUT bit
    );
END jk_ff;

ARCHITECTURE jk_ff_arch OF jk_ff IS
    SIGNAL qint : bit;
    BEGIN
        q <= qint;
        PROCESS(clock)
            BEGIN
                IF (clock'event AND clock='1') THEN
                    qint <= (j AND (NOT qint)) OR ((NOT k) AND qint);
                END IF;
            END PROCESS;
    END jk_ff_arch;