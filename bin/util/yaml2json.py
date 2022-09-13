#!/usr/bin/env python3
#
# yaml2json → Python version
#
# Read a YAML document on stdin and print its equivalent JSON.
#

import json
import sys
import yaml

# https://pyyaml.org/wiki/PyYAMLDocumentation
json.dump(yaml.load(sys.stdin, Loader=yaml.CLoader), sys.stdout, indent=4)
print()
