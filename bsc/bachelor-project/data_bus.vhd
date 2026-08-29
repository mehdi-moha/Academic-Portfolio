--------------
-- Data BUS --
--------------
ENTITY data_bus IS
    PORT
    (
        ar : IN bit_vector(11 DOWNTO 0);
        pc : IN bit_vector(11 DOWNTO 0);
        dr : IN bit_vector(15 DOWNTO 0);
        ac : IN bit_vector(15 DOWNTO 0);
        ir : IN bit_vector(15 DOWNTO 0);
        tr : IN bit_vector(15 DOWNTO 0);
        m : IN bit_vector(15 DOWNTO 0);
        s : IN bit_vector(2 DOWNTO 0);
        o : OUT bit_vector(15 DOWNTO 0)
    );
END data_bus;

ARCHITECTURE data_bus_arch OF data_bus IS
    BEGIN
        PROCESS(ar,pc,dr,ac,ir,tr,m,s)
            BEGIN
                CASE s IS
                    WHEN "000" => o <= "0000000000000000";
                    WHEN "001" => o <= "0000" & ar;
                    WHEN "010" => o <= "0000" & pc;
                    WHEN "011" => o <= dr;
                    WHEN "100" => o <= ac;
                    WHEN "101" => o <= ir;
                    WHEN "110" => o <= tr;
                    WHEN "111" => o <= m;
                END CASE;               
            END PROCESS;
    END data_bus_arch;