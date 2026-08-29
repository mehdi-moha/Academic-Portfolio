---------------------------------
-- JK Flip Flop With Set Input --
---------------------------------
ENTITY jk_ff_set IS
    PORT
    (
        j,k,set,clock : IN bit;
        q : OUT bit
    );
END jk_ff_set;

ARCHITECTURE jk_ff_set_arch OF jk_ff_set IS
    SIGNAL qint : bit;
    BEGIN
        q <= qint;
        PROCESS(set,clock)
            BEGIN
                IF (set='1') THEN
                    qint <= '1';
                ELSIF (clock'event AND clock='1') THEN
                    qint <= (j AND (NOT qint)) OR ((NOT k) AND qint);
                END IF;
            END PROCESS;
    END jk_ff_set_arch;