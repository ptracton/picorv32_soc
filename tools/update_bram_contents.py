#! /usr/bin/env python3

"""
update_bram_contents.py

Updates the BRAM contents of a placed and routed Xilinx Vivado design

"""

import argparse
import json
import os
import sys


def which(program):
    """
    Find the path to an executable program
    """

    def is_exe(fpath):
        """
        Return True is the fpath exists and is executable. This is needed since
        executables are specifed in the JSON files, but not the path to them.
        The executables may be in different locations based on which PC is
        running this.
        """
        return os.path.isfile(fpath) and os.access(fpath, os.X_OK)

    fpath, fname = os.path.split(program)
    if fpath:
        if is_exe(program):
            return program
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            path = path.strip('"')
            exe_file = os.path.join(path, program)
            if is_exe(exe_file):
                return exe_file

    return None

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Update BRAM Contents')
    parser.add_argument("-D", "--debug",
                        help="Debug this script",
                        action="store_true")
    parser.add_argument("--config",
                        help="Config file for update",
                        required=True,
                        default=None,
                        action="store")

    args = parser.parse_args()
    if args.debug:
        print(os.environ['PATH'])
        print(args)

    try:
        f = open(args.config, "r")
        json_data = json.load(f)
    except:
        print("Failed to open %s" % (args.config))
        sys.exit(-1)
