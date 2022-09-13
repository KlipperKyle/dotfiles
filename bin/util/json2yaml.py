#!/usr/bin/env python3
#
# json2yaml → Python version
#
# Read a JSON document on stdin and print its equivalent YAML.
#

import json
import sys
import yaml

# https://pyyaml.org/wiki/PyYAMLDocumentation
yaml.dump(json.load(sys.stdin), sys.stdout)
