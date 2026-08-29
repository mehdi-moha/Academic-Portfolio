-------------------
-- Register Cell --
-------------------
ENTITY rc IS
    PORT
    (
        inp_2,inp_1,inp_0,en,ck,i : IN bit;
        a : OUT bit;
        c : OUT bit
    );
END rc;

ARCHITECTURE rc_arch OF rc IS
    COMPONENT jk_ff IS
        PORT
        (
            j,k,clock : IN bit;
            q : OUT bit
        );
    END COMPONENT;
    SIGNAL sig : bit_vector(2 DOWNTO 0);
    BEGIN
        sig(0) <= en AND (inp_2 OR (inp_1 AND i));
        sig(1) <= en AND ((inp_0 OR inp_2) OR (inp_1 AND (NOT i)));
        u0 : jk_ff PORT MAP(sig(0),sig(1),ck,sig(2));
        a <= sig(2);
        c <= sig(2) AND inp_2;
    END rc_arch;