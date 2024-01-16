import os
import subprocess
import time

fp = open("SUBTRACTOR_Delay_output.txt",'w')
fp.close()

command = "ngspice tempfile.ckt"
for i in range(0,8):
    if(i<4):
        I = "B"
        J = "A"
        V = "0"
    else:
        I = "A"
        J = "B"
        V = "'SUPPLY'"
    for j in range(0,4):
        f2 = open("tempfile.ckt",'w') #run file/destination file
        fp = open("SUBTRACTOR_Delay_output.txt",'a') #output file

        mode1 = "RISE"
        mode2 = "FALL"
        mode3 = "FALL"
        mode4 = "RISE"

        In = J+str(i%4)
        Out = "Y" + str(j)

        f1 = open("ALU.ckt",'r') #source file

        data = f1.read()

        S_search_text = "*SELECT LINES INPUT"

        S_replace_text = '''
Vs0 S0 GND DC 'SUPPLY'
Vs1 S1 GND DC 0
        '''
        data = data.replace(S_search_text,S_replace_text)

        A_search_text = "*INPUT 1"

        A_replace_text = f'''
Va0 {I}0 GND DC {V}
Va1 {I}1 GND DC {V}
Va2 {I}2 GND DC {V}
Va3 {I}3 GND DC {V}
        '''
        data = data.replace(A_search_text,A_replace_text)

        B_search_text = "*INPUT 2"

        B_replace_text = f'''
Vb0 {J}0 GND PULSE(0 1.8 25ns 10ps 10ps 50ns 100ns)
Vb1 {J}1 GND PULSE(0 1.8 25ns 10ps 10ps 50ns 100ns)
Vb2 {J}2 GND PULSE(0 1.8 25ns 10ps 10ps 50ns 100ns)
Vb3 {J}3 GND PULSE(0 1.8 25ns 10ps 10ps 50ns 100ns)
        '''
        data = data.replace(B_search_text,B_replace_text)

        delay_search_text = "*Delay Analysis Text"
        delay_replace_text = f'''
.measure tran trise 
+ TRIG v({In}) VAL = 'SUPPLY/2' {mode1} =1
+ TARG v({Out}) VAL = 'SUPPLY/2' {mode2} =1 

.measure tran tfall 
+ TRIG v({In}) VAL = 'SUPPLY/2' {mode3} =1 
+ TARG v({Out}) VAL = 'SUPPLY/2' {mode4} =1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
        '''
        data = data.replace(delay_search_text,delay_replace_text)
        f1.close()
        f2.write(data)
        f2.close()

        completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if completed_process.returncode == 0:
            output = completed_process.stdout
        else:
            output = ("Command execution failed")

        output = output.split('\n')
        output = output[-4] 
        additional_text = f"\t >> Input = {In} , Output = {Out} \n"

        if(i==0 and j==0):
             fp.write(f"Delay Analysis for SUBTRACTOR :\n\n")
        fp.write(output+additional_text)
        time.sleep(0.1)
    fp.write(f'\n')


