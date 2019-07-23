vsim -gui work.unitrasgnlcounttop
# vsim -gui work.unitrasgnlcounttop 
# Start time: 10:48:12 on Jul 22,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.unitrasgnlcounttop(top)
# Loading work.unitrasgnlcount(behave)
# Loading work.countfsm(behave)
add wave -r /*

force -freeze sim:/unitrasgnlcounttop/clk_in 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/unitrasgnlcounttop/rst_in 1 0
force -freeze sim:/unitrasgnlcounttop/Ta_in 0 0
force -freeze sim:/unitrasgnlcounttop/Tb_in 1 0
run
force -freeze sim:/unitrasgnlcounttop/rst_in 0 0
run
run
run
run
force -freeze sim:/unitrasgnlcounttop/Tb_in 0 0
run
run
force -freeze sim:/unitrasgnlcounttop/Ta_in 1 0
run
force -freeze sim:/unitrasgnlcounttop/Ta_in 0 0
run
run
force -freeze sim:/unitrasgnlcounttop/Tb_in 1 0
run
force -freeze sim:/unitrasgnlcounttop/Tb_in 0 0
run
run
