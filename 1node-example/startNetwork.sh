#!/bin/bash
PRIVATE_CONFIG=ignore nohup geth --datadir node1 --config conf.toml --verbosity 5 >> node.log 2>&1 &