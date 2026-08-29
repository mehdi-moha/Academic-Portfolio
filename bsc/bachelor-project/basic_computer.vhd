--------------------
-- Basic Computer --
--------------------
ENTITY basic_computer IS
    PORT
    (
        clock,inpr_clock,set_fgi : IN bit;
        set_fgo,set_s : IN bit:='1';
        inpr_i : IN bit_vector(7 DOWNTO 0);
        outr_o : OUT bit_vector(7 DOWNTO 0);
        fgi_status,fgo_status,s_status : OUT bit
    );
END basic_computer;

ARCHITECTURE basic_computer_arch OF basic_computer IS
    -- JK Flip Flop --
    COMPONENT jk_ff IS
        PORT
        (
            j,k,clock : IN bit;
            q : OUT bit
        );
    END COMPONENT;

    -- JK Flip Flop With Set Input --
    COMPONENT jk_ff_set IS
        PORT
        (
            j,k,set,clock : IN bit;
            q : OUT bit
        );
    END COMPONENT;

    -- JK Flip Flop With Reset And Set Inputs --
    COMPONENT jk_ff_reset_set IS
        PORT
        (
            j,k,reset,set,clock : IN bit;
            q : OUT bit
        );
    END COMPONENT;

    -- 4*16 Decoder --
    COMPONENT dec416 IS
        PORT
        (
            i : IN bit_vector(3 DOWNTO 0);
            o : OUT bit_vector(15 DOWNTO 0)
        );
    END COMPONENT;

    -- 3*8 Decoder --
    COMPONENT dec38 IS
        PORT
        (
            i : IN bit_vector(2 DOWNTO 0);
            o : OUT bit_vector(7 DOWNTO 0)
        );
    END COMPONENT;

    -- 4096*16 Memory --
    COMPONENT memory IS
        PORT
        (
            i : IN bit_vector(15 DOWNTO 0);
            a : IN bit_vector(11 DOWNTO 0);
            rm,wm,clock : IN bit;
            o : OUT bit_vector(15 DOWNTO 0)
        );
    END COMPONENT;

    -- 16 Bit Register --
    COMPONENT sbr IS
        PORT
        (
            clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
            i_in : IN bit_vector(15 DOWNTO 0);
            a_out : OUT bit_vector(15 DOWNTO 0)
        );
    END COMPONENT;

    -- 12 Bit Register --
    COMPONENT tbr IS
        PORT
        (
            clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
            i_in : IN bit_vector(11 DOWNTO 0);
            a_out : OUT bit_vector(11 DOWNTO 0)
        );
    END COMPONENT;

    -- 8 Bit Register --
    COMPONENT ebr IS
        PORT
        (
            clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
            i_in : IN bit_vector(7 DOWNTO 0);
            a_out : OUT bit_vector(7 DOWNTO 0)
        );
    END COMPONENT;

    -- 4 Bit Register --
    COMPONENT fbr IS
        PORT
        (
            clr_in,ld_in,inr_in,en_in,clk_in : IN bit;
            i_in : IN bit_vector(3 DOWNTO 0);
            a_out : OUT bit_vector(3 DOWNTO 0)
        );
    END COMPONENT;

    -- 16 Bit ALU --
    COMPONENT sba IS
        PORT
        (
            and_op_in,add_op_in,dr_op_in,inpr_op_in,com_op_in,shr_op_in,shl_op_in : IN bit;
            ac : IN bit_vector(15 DOWNTO 0);
            dr : IN bit_vector(15 DOWNTO 0);
            inpr : IN bit_vector(7 DOWNTO 0);
            q_e : IN bit;
            o : OUT bit_vector(15 DOWNTO 0);
            carry_out : OUT bit
        );
    END COMPONENT;

    -- Data BUS --
    COMPONENT data_bus IS
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
    END COMPONENT;

    -- Control Unit --
    COMPONENT cu IS
        PORT
        (
            d : IN bit_vector(7 DOWNTO 0);
            t : IN bit_vector(15 DOWNTO 0);
            b : IN bit_vector(11 DOWNTO 0);
            ac : IN bit_vector(15 DOWNTO 0);
            dr : IN bit_vector(15 DOWNTO 0);
            ir15,cout,q_e,q_i,q_ien,q_fgi,q_fgo,q_r : IN bit;
            s : OUT bit_vector(2 DOWNTO 0);
            clr_ar,ld_ar,inr_ar : OUT bit;
            clr_pc,ld_pc,inr_pc : OUT bit;
            ld_dr,inr_dr : OUT bit;
            clr_ac,ld_ac,inr_ac : OUT bit;
            ld_ir : OUT bit;
            ld_tr : OUT bit;
            rm,wm : OUT bit;
            ld_outr : OUT bit;
            clr_sc,inr_sc : OUT bit;
            j_e,k_e,reset_e,set_e,j_i,k_i,j_ien,k_ien,k_fgi,k_fgo,j_r,k_r,k_s : OUT bit;
            and_op,add_op,dr_op,inpr_op,com_op,shr_op,shl_op : BUFFER bit
        );
    END COMPONENT;
    SIGNAL dr_out,ac_out,ir_out,tr_out,memory_out,bus_out : bit_vector(15 DOWNTO 0);
    SIGNAL ar_out,pc_out : bit_vector(11 DOWNTO 0);
    SIGNAL inpr_out : bit_vector(7 DOWNTO 0);
    SIGNAL t_out : bit_vector(15 DOWNTO 0);
    SIGNAL d_out : bit_vector(7 DOWNTO 0);
    SIGNAL s_out : bit_vector(2 DOWNTO 0);
    SIGNAL clr_ar_w,ld_ar_w,inr_ar_w : bit;
    SIGNAL clr_pc_w,ld_pc_w,inr_pc_w : bit;
    SIGNAL ld_dr_w,inr_dr_w : bit;
    SIGNAL clr_ac_w,ld_ac_w,inr_ac_w : bit;
    SIGNAL ld_ir_w : bit;
    SIGNAL ld_tr_w : bit;
    SIGNAL rm_w,wm_w : bit;
    SIGNAL ld_outr_w : bit;
    SIGNAL clr_sc_w,inr_sc_w : bit;
    SIGNAL j_e_w,k_e_w,reset_e_w,set_e_w,j_i_w,k_i_w,j_ien_w,k_ien_w,k_fgi_w,k_fgo_w,j_r_w,k_r_w,k_s_w : bit;
    SIGNAL and_op_w,add_op_w,dr_op_w,inpr_op_w,com_op_w,shr_op_w,shl_op_w : bit;
    SIGNAL q_e_w,q_i_w,q_ien_w,q_fgi_w,q_fgo_w,q_r_w,q_s_w : bit;
    SIGNAL alu_out : bit_vector(15 DOWNTO 0);
    SIGNAL carry_out_w : bit;
    SIGNAL zero : bit:='0';
    SIGNAL one : bit:='1';
    SIGNAL sc_in : bit_vector(3 DOWNTO 0):=("0000");
    SIGNAL sc_out : bit_vector(3 DOWNTO 0);
    BEGIN
        ar_chip : tbr PORT MAP(clr_ar_w,ld_ar_w,inr_ar_w,one,clock,bus_out(11 DOWNTO 0),ar_out);
        pc_chip : tbr PORT MAP(clr_pc_w,ld_pc_w,inr_pc_w,one,clock,bus_out(11 DOWNTO 0),pc_out);
        dr_chip : sbr PORT MAP(zero,ld_dr_w,inr_dr_w,one,clock,bus_out,dr_out);
        ac_chip : sbr PORT MAP(clr_ac_w,ld_ac_w,inr_ac_w,one,clock,alu_out,ac_out);
        ir_chip : sbr PORT MAP(zero,ld_ir_w,zero,one,clock,bus_out,ir_out);
        tr_chip : sbr PORT MAP(zero,ld_tr_w,zero,one,clock,bus_out,tr_out);
        inpr_chip : ebr PORT MAP(zero,one,zero,one,inpr_clock,inpr_i,inpr_out);
        outr_chip : ebr PORT MAP(zero,ld_outr_w,zero,one,clock,bus_out(7 DOWNTO 0),outr_o);
        sc_chip : fbr PORT MAP(clr_sc_w,zero,inr_sc_w,q_s_w,clock,sc_in,sc_out);
        ram_chip : memory PORT MAP(bus_out,ar_out,rm_w,wm_w,clock,memory_out);
        data_bus_chip : data_bus PORT MAP(ar_out,pc_out,dr_out,ac_out,ir_out,tr_out,memory_out,s_out,bus_out);
        control_unit_chip : cu PORT MAP(d_out,t_out,ir_out(11 DOWNTO 0),ac_out,dr_out,ir_out(15),carry_out_w,q_e_w,q_i_w,q_ien_w,q_fgi_w,q_fgo_w,q_r_w,s_out,clr_ar_w,ld_ar_w,inr_ar_w,clr_pc_w,ld_pc_w,inr_pc_w,ld_dr_w,inr_dr_w,clr_ac_w,ld_ac_w,inr_ac_w,ld_ir_w,ld_tr_w,rm_w,wm_w,ld_outr_w,clr_sc_w,inr_sc_w,j_e_w,k_e_w,reset_e_w,set_e_w,j_i_w,k_i_w,j_ien_w,k_ien_w,k_fgi_w,k_fgo_w,j_r_w,k_r_w,k_s_w,and_op_w,add_op_w,dr_op_w,inpr_op_w,com_op_w,shr_op_w,shl_op_w);
        timing_decoder_chip : dec416 PORT MAP(sc_out,t_out);
        opcode_decoder_chip : dec38 PORT MAP(ir_out(14 DOWNTO 12),d_out);
        alu_chip : sba PORT MAP(and_op_w,add_op_w,dr_op_w,inpr_op_w,com_op_w,shr_op_w,shl_op_w,ac_out,dr_out,inpr_out,q_e_w,alu_out,carry_out_w);
        e_ff : jk_ff_reset_set PORT MAP(j_e_w,k_e_w,reset_e_w,set_e_w,clock,q_e_w);
        i_ff : jk_ff PORT MAP(j_i_w,k_i_w,clock,q_i_w);
        ien_ff : jk_ff PORT MAP(j_ien_w,k_ien_w,clock,q_ien_w);
        fgi_ff : jk_ff_set PORT MAP(zero,k_fgi_w,set_fgi,clock,q_fgi_w);
        fgo_ff : jk_ff_set PORT MAP(zero,k_fgo_w,set_fgo,clock,q_fgo_w);
        r_ff : jk_ff PORT MAP(j_r_w,k_r_w,clock,q_r_w);
        s_ff : jk_ff_set PORT MAP(zero,k_s_w,set_s,clock,q_s_w);
        fgi_status <= q_fgi_w;
        fgo_status <= q_fgo_w;
        s_status <= q_s_w;
    END basic_computer_arch;