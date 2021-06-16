#!/usr/bin/env python3


import configparser
import json
import sys


if __name__ == "__main__":
    data = json.loads(sys.stdin.read())

    if not isinstance(data, dict):
        raise ValueError("Input value is not a JSON object")

    cfg = configparser.ConfigParser()

    for key, value in data.items():
        cfg[key] = value

    cfg.write(sys.stdout)