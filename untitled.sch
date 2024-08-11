v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -100 -320 -60 -320 {
lab=vout}
N -60 -320 -60 -210 {
lab=vout}
N -110 -210 -60 -210 {
lab=vout}
N -110 -150 -110 -60 {
lab=GND}
N -110 -180 -100 -180 {
lab=GND}
N -100 -180 -100 -130 {
lab=GND}
N -110 -130 -100 -130 {
lab=GND}
N -190 -180 -150 -180 {
lab=vin}
N -190 -350 -190 -180 {
lab=vin}
N -190 -350 -140 -350 {
lab=vin}
N -250 -270 -190 -270 {
lab=vin}
N 20 -140 20 -60 {
lab=GND}
N 20 -260 20 -200 {
lab=vout}
N -60 -260 20 -260 {
lab=vout}
N -100 -440 -100 -380 {
lab=#net1}
N -420 -190 -420 -150 {
lab=vin}
N -420 -90 -420 0 {
lab=GND}
N -530 -90 -530 0 {
lab=GND}
N -530 -180 -530 -150 {
lab=VDD}
N -100 -520 -100 -500 {
lab=VDD}
N -100 -350 -20 -350 {
lab=#net1}
N -20 -410 -20 -350 {
lab=#net1}
N -100 -410 -20 -410 {
lab=#net1}
C {primitives/pfet.sym} -120 -350 2 1 {name=M1 
model=pchor1ex
W=3.3u
L=1.0u
m=1
}
C {primitives/} -60 -250 0 0 {name=x1}
C {primitives/nfet.sym} -130 -180 0 0 {name=M2 
model=nchor1ex
W=2.0u
L=1.0u
m=1
}
C {devices/code.sym} -540 -450 0 0 {name=PIS06_MODELS 
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/mos.lib
.include $::LIB/passive.lib
.include $::LIB/diode.lib"
spice_ignore=false}
C {devices/code_shown.sym} 150 -440 0 0 {name=spice only_toplevel=false 
value=".option savecurrent 
.control
save all


* DC analysis(I/O curve)
dc vin 0 5.0 0.01
plot vout vin
plot i(vd)
wrdata ~/inverter_tab_mac.txt v(vout)
write inverter_tab_mac.raw
.endc
"}
C {devices/vsource.sym} -420 -120 0 0 {name=vin value=5.0 savecurrent=false}
C {devices/gnd.sym} -110 -60 0 0 {name=l1 lab=GND}
C {devices/ammeter.sym} -100 -470 0 0 {name=Vd savecurrent=true spice_ignore=0}
C {devices/lab_pin.sym} -250 -270 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/capa.sym} 20 -170 0 0 {name=Cload
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 20 -60 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 20 -260 0 1 {name=p2 sig_type=std_logic lab=vout
}
C {devices/vdd.sym} -100 -520 0 0 {name=l3 lab=VDD}
C {devices/vdd.sym} -530 -180 0 0 {name=l4 lab=VDD}
C {devices/vsource.sym} -530 -120 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/lab_pin.sym} -420 -190 0 0 {name=p4 sig_type=std_logic lab=vin}
C {devices/gnd.sym} -420 0 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} -530 0 0 0 {name=l7 lab=GND}
C {devices/code_shown.sym} 140 -200 0 0 {name=measure only_toplevel=false 
value=".measure dc Vinv when v(vout) = 2.5 
"}
