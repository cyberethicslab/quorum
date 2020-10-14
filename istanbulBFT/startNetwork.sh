#!/bin/bash
rm node0/node0.log
rm node0/nohup.out
rm node1/node1.log
rm node1/nohup.out
rm node2/node2.log
rm node2/nohup.out

cd node0
PRIVATE_CONFIG=ignore nohup geth --datadir data --config conf.toml --verbosity 5 >> node0.log &

cd ../node1
PRIVATE_CONFIG=ignore nohup geth --datadir data --config conf.toml --verbosity 5 >> node1.log &

cd ../node2
PRIVATE_CONFIG=ignore nohup geth --datadir data --config conf.toml --verbosity 5 >> node2.log &

echo "Network started..."