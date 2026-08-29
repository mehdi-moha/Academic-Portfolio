transcript on

onbreak {stop}
quietly set NoQuitOnFinish 1

proc aw {args} {
    if {[catch {eval add wave $args} error_message]} {
        puts "Wave warning: $error_message"
    }
}

proc al {args} {
    if {[catch {eval add list $args} error_message]} {
        puts "List warning: $error_message"
    }
}

if {[file exists work]} {
    catch {vdel -lib work -all}
}

vlib work
vmap work work

vcom *.vhd

vsim -voptargs=+acc work.basic_computer

# -------------------------
# Wave signals
# -------------------------

aw sim:/basic_computer/clock
aw sim:/basic_computer/inpr_clock
aw sim:/basic_computer/set_fgi
aw sim:/basic_computer/set_fgo
aw sim:/basic_computer/set_s
aw -radix bin sim:/basic_computer/inpr_i

aw -radix dec sim:/basic_computer/outr_o
aw sim:/basic_computer/fgi_status
aw sim:/basic_computer/fgo_status
aw sim:/basic_computer/s_status

aw -radix bin sim:/basic_computer/dr_out
aw -radix dec sim:/basic_computer/ac_out
aw -radix bin sim:/basic_computer/ir_out
aw -radix bin sim:/basic_computer/tr_out
aw -radix bin sim:/basic_computer/memory_out
aw -radix bin sim:/basic_computer/bus_out
aw -radix dec sim:/basic_computer/ar_out
aw -radix dec sim:/basic_computer/pc_out
aw -radix bin sim:/basic_computer/inpr_out

aw -radix bin sim:/basic_computer/t_out
aw -radix bin sim:/basic_computer/d_out
aw -radix bin sim:/basic_computer/s_out

aw sim:/basic_computer/clr_ar_w
aw sim:/basic_computer/ld_ar_w
aw sim:/basic_computer/inr_ar_w

aw sim:/basic_computer/clr_pc_w
aw sim:/basic_computer/ld_pc_w
aw sim:/basic_computer/inr_pc_w

aw sim:/basic_computer/ld_dr_w
aw sim:/basic_computer/inr_dr_w

aw sim:/basic_computer/clr_ac_w
aw sim:/basic_computer/ld_ac_w
aw sim:/basic_computer/inr_ac_w

aw sim:/basic_computer/ld_ir_w
aw sim:/basic_computer/ld_tr_w

aw sim:/basic_computer/rm_w
aw sim:/basic_computer/wm_w
aw sim:/basic_computer/ld_outr_w

aw sim:/basic_computer/clr_sc_w
aw sim:/basic_computer/inr_sc_w

aw -radix dec sim:/basic_computer/ram_chip/RAM(19)
aw -radix dec sim:/basic_computer/ram_chip/RAM(103)
aw -radix dec sim:/basic_computer/ram_chip/RAM(105)

configure wave -namecolwidth 250
configure wave -valuecolwidth 120
wave zoom full


# -------------------------
# List signals for data.txt
# -------------------------

view list

al sim:/basic_computer/clock
al sim:/basic_computer/inpr_clock
al sim:/basic_computer/set_fgi
al sim:/basic_computer/set_fgo
al sim:/basic_computer/set_s
al -radix bin sim:/basic_computer/inpr_i

al -radix dec sim:/basic_computer/outr_o
al sim:/basic_computer/fgi_status
al sim:/basic_computer/fgo_status
al sim:/basic_computer/s_status

al -radix bin sim:/basic_computer/dr_out
al -radix dec sim:/basic_computer/ac_out
al -radix bin sim:/basic_computer/ir_out
al -radix bin sim:/basic_computer/tr_out
al -radix bin sim:/basic_computer/memory_out
al -radix bin sim:/basic_computer/bus_out
al -radix dec sim:/basic_computer/ar_out
al -radix dec sim:/basic_computer/pc_out
al -radix bin sim:/basic_computer/inpr_out

al -radix bin sim:/basic_computer/t_out
al -radix bin sim:/basic_computer/d_out
al -radix bin sim:/basic_computer/s_out

al sim:/basic_computer/clr_ar_w
al sim:/basic_computer/ld_ar_w
al sim:/basic_computer/inr_ar_w

al sim:/basic_computer/clr_pc_w
al sim:/basic_computer/ld_pc_w
al sim:/basic_computer/inr_pc_w

al sim:/basic_computer/ld_dr_w
al sim:/basic_computer/inr_dr_w

al sim:/basic_computer/clr_ac_w
al sim:/basic_computer/ld_ac_w
al sim:/basic_computer/inr_ac_w

al sim:/basic_computer/ld_ir_w
al sim:/basic_computer/ld_tr_w

al sim:/basic_computer/rm_w
al sim:/basic_computer/wm_w
al sim:/basic_computer/ld_outr_w

al sim:/basic_computer/clr_sc_w
al sim:/basic_computer/inr_sc_w

al -radix dec sim:/basic_computer/ram_chip/RAM(19)
al -radix dec sim:/basic_computer/ram_chip/RAM(103)
al -radix dec sim:/basic_computer/ram_chip/RAM(105)


# -------------------------
# Forces and simulation
# -------------------------

force -freeze sim:/basic_computer/clock 1 0ns, 0 50ns -repeat 100ns

force -freeze sim:/basic_computer/inpr_clock 0 0ns
force -freeze sim:/basic_computer/set_fgi 0 0ns
force -freeze sim:/basic_computer/set_fgo 0 0ns
force -freeze sim:/basic_computer/set_s 0 0ns

force -freeze sim:/basic_computer/inpr_i 01010000 0ns

force -freeze sim:/basic_computer/set_s 1 0ns
run 100 ns
force -freeze sim:/basic_computer/set_s 0 0ns

run 18000 ns

force -freeze sim:/basic_computer/set_fgi 1 0ns
force -freeze sim:/basic_computer/set_fgo 1 0ns
run 100 ns

force -freeze sim:/basic_computer/set_fgi 0 0ns
force -freeze sim:/basic_computer/set_fgo 0 0ns

run 5500 ns

force -freeze sim:/basic_computer/set_fgo 1 0ns
run 100 ns
force -freeze sim:/basic_computer/set_fgo 0 0ns

run 3200 ns

wave zoom full

# -------------------------
# Save list output
# -------------------------

write list data.txt