#! /usr/bin/env python3

"""
mem_to_bram.py

Converts a verilog mem file to init statements for 4 BRAMs arranged as a word

"""

import argparse
import sys

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Split MEM file into BRAM init statements')

    parser.add_argument("-D", "--debug",
                        help="Debug this script",
                        action="store_true")
    parser.add_argument("--mem",
                        help="Which MEM file to use",
                        required=True,
                        action="store")

    args = parser.parse_args()
    if args.debug:
        print(args)

    try:
        mem_file = open(args.mem, "r")
        mem_file_lines = mem_file.readlines()
        mem_file.close()

        bram0_file = open("bram0.txt", "w")
        bram1_file = open("bram1.txt", "w")
        bram2_file = open("bram2.txt", "w")
        bram3_file = open("bram3.txt", "w")

        lst_file = open(args.mem+".loc", "w")

    except:
        print("Failed to open or read %s" % args.mem)
        sys.exit(-1)

    address = 0
    init_number = 0
    bank_number = 0
    bram0_init_string = "defparam testbench.dut.rom0.ram0.bank{bank_number}.ram0.INIT_"
    bram1_init_string = "defparam testbench.dut.rom0.ram0.bank{bank_number}.ram1.INIT_"
    bram2_init_string = "defparam testbench.dut.rom0.ram0.bank{bank_number}.ram2.INIT_"
    bram3_init_string = "defparam testbench.dut.rom0.ram0.bank{bank_number}.ram3.INIT_"
    index = 0
    bram0_init = []
    bram1_init = []
    bram2_init = []
    bram3_init = []
    
#    print("ADDRESS\t\tByte3\tByte2\tByte1\tByte0")
    for line in mem_file_lines[1:]:
        values = line.split(' ')
        address = int(values[0][1:], 16)
        for data in values[1:]:
            data_hex = int(data, 16)
            data_bytes = [hex(data_hex >> i & 0xff) for i in (24, 16, 8, 0)]

            # Swap the order 
            byte3 = int(data_bytes[0][2:], 16)
            byte2 = int(data_bytes[1][2:], 16)
            byte1 = int(data_bytes[2][2:], 16)
            byte0 = int(data_bytes[3][2:], 16)

            # always have 8 bits of data
            byte3_str = "{:02X}".format(byte3)
            byte2_str = "{:02X}".format(byte2)
            byte1_str = "{:02X}".format(byte1)
            byte0_str = "{:02X}".format(byte0)
            
            bram3_init.append(byte3_str)
            bram2_init.append(byte2_str)
            bram1_init.append(byte1_str)
            bram0_init.append(byte0_str)
            
#            print("0x%08x\t0x%02X\t\t0x%02X\t\t0x%02X\t\t0x%02X" % (address, byte0, byte1, byte2, byte3))
            lst_file.write("%08X\t0x%02X%02X%02X%02X\n"% (address, byte3, byte2, byte1, byte0))
            index = index + 1
            if index % 32 == 0:
                bram0_init.reverse()
                bram1_init.reverse()
                bram2_init.reverse()
                bram3_init.reverse()
                b0 = '_'.join(str(x) for x in bram0_init)
                b1 = '_'.join(str(x) for x in bram1_init)
                b2 = '_'.join(str(x) for x in bram2_init)
                b3 = '_'.join(str(x) for x in bram3_init)

                bram0_file.write(bram0_init_string.format(bank_number=bank_number)+"%02X = 256'h%s;\n" % (init_number, b0))
                bram1_file.write(bram1_init_string.format(bank_number=bank_number)+"%02X = 256'h%s;\n" % (init_number, b1))
                bram2_file.write(bram2_init_string.format(bank_number=bank_number)+"%02X = 256'h%s;\n" % (init_number, b2))
                bram3_file.write(bram3_init_string.format(bank_number=bank_number)+"%02X = 256'h%s;\n" % (init_number, b3))

                bram0_init = []
                bram1_init = []
                bram2_init = []
                bram3_init = []

                init_number = init_number + 1
                index = 0
                if init_number == 0x40:
                    init_number = 0
                    bank_number = bank_number + 1
            address = address + 1

    bram0_file.close()
    bram1_file.close()
    bram2_file.close()
    bram3_file.close()
    lst_file.close()
