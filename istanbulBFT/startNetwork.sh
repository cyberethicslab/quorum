#!/bin/bash
cd node0
PRIVATE_CONFIG=ignore nohup geth --datadir data --nodiscover --syncmode full --mine --minerthreads 1 --verbosity 5 --networkid 10 --rpc --rpcaddr 0.0.0.0 --rpcport 22000 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul --port 30300 2>>node0.log &

cd ../node1
PRIVATE_CONFIG=ignore nohup geth --datadir data --nodiscover --syncmode full --mine --minerthreads 1 --verbosity 5 --networkid 10 --rpc --rpcaddr 0.0.0.0 --rpcport 22001 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul --port 30301 2>>node1.log &

cd ../node2
PRIVATE_CONFIG=ignore nohup geth --datadir data --nodiscover --syncmode full --mine --minerthreads 1 --verbosity 5 --networkid 10 --rpc --rpcaddr 0.0.0.0 --rpcport 22002 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul --port 30302 2>>node2.log &

