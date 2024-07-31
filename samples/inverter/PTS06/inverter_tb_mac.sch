v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 190 -220 230 -220 {
lab=vout}
N 230 -220 230 -120 {
lab=vout}
N 190 -120 230 -120 {
lab=vout}
N 120 -90 150 -90 {
lab=vin}
N 120 -250 120 -90 {
lab=vin}
N 120 -250 150 -250 {
lab=vin}
N 50 -170 120 -170 {
lab=vin}
N 230 -170 300 -170 {
lab=vout}
N 190 -60 190 -10 {
lab=GND}
N 190 -90 200 -90 {
lab=GND}
N 200 -90 200 -50 {
lab=GND}
N 190 -50 200 -50 {
lab=GND}
N 190 -290 200 -290 {
lab=#net1}
N 200 -290 200 -250 {
lab=#net1}
N 190 -250 200 -250 {
lab=#net1}
N -130 -150 -130 -120 {
lab=vin}
N -130 -60 -130 -20 {
lab=GND}
N -210 -60 -210 -20 {
lab=GND}
N -210 -150 -210 -120 {
lab=VDD}
N 190 -400 190 -380 {
lab=VDD}
N 190 -320 190 -290 {
lab=#net1}
N 190 -290 190 -280 {
lab=#net1}
N 300 -170 300 -100 {
lab=vout}
N 300 -40 300 -10 {
lab=GND}
C {devices/code.sym} -250 -350 0 0 {name=PTS06_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include /Users/[user]/.xschem/lib/PTS06/mos.lib
.include /Users/[user]/.xschem/lib/PTS06/stdcells.lib"
spice_ignore=false}
C {devices/vdd.sym} 190 -400 0 0 {name=l1}
C {devices/gnd.sym} 190 -10 0 0 {name=l2}
C {devices/vsource.sym} -210 -90 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/vdd.sym} -210 -150 0 0 {name=l3}
C {devices/gnd.sym} -210 -20 0 0 {name=l4}
C {devices/vsource.sym} -130 -90 0 0 {name=vin value=5.0 savecurrent=false}
C {devices/lab_pin.sym} 50 -170 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 300 -170 0 1 {name=p2 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} -130 -150 1 0 {name=p3 sig_type=std_logic lab=vin}
C {devices/gnd.sym} -130 -20 0 0 {name=l5}
C {devices/code_shown.sym} 390 -330 0 0 {name=spice only_toplevel=false value=".option savecurrent
.control
save all

* DC analysis (I/O curve)
dc vin 0 5.0 0.01
plot vout vin
plot i(vd)
wrdata ~/inverter_tb_mac.txt v(vout)
write inverter_tb_mac.raw
.endc"}
C {devices/code_shown.sym} 390 -40 0 0 {name=measure only_toplevel=false value=".measure dc Vinv when v(vout)=2.5"}
C {devices/ammeter.sym} 190 -350 0 0 {name=Vd savecurrent=true spice_ignore=0}
C {devices/gnd.sym} 300 -10 0 0 {name=l6}
C {devices/capa.sym} 300 -70 0 0 {name=Cload
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {primitives/pfet.sym} 170 -250 0 0 {name=M1 
model=pchor1ex
W=3.3u
L=1.0u
m=1
}
C {primitives/nfet.sym} 170 -90 0 0 {name=M2 
model=nchor1ex
W=2.0u
L=1.0u
m=1
}