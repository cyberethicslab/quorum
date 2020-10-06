# 1 Node quorum network #

## Introduction ##
Through this example you can build a Quorum network formed by 1 node. This example can be used in order to test your development environment and trying to explore the Quorum framework.

### How to reproduce the example ###

1. Create the repository for our node
```console
mkdir node1
```

2. Generate account for the node
```console
geth --datadir node1 account new
```

3. Create the genesis.json file.
```json
{
  "alloc": {
    "0xed9d02e382b34818e88b88a309c7fe71e65f419d": {
      "balance": "1000000000000000000000000000"
    },
    "0xca843569e3427144cead5e4d5999a3d0ccf92b8e": {
      "balance": "1000000000000000000000000000"
    }
  },
  "coinbase": "0x0000000000000000000000000000000000000000",
  "config": {
    "homesteadBlock": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "chainId": 10,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "eip158Block": 0,
    "maxCodeSizeConfig": [
      {
        "block": 0,
        "size": 35
      }
    ],
    "isQuorum": true
  },
  "difficulty": "0x0",
  "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0xE0000000",
  "mixhash": "0x00000000000000000000000000000000000000647572616c65787365646c6578",
  "nonce": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp": "0x00"
}
```

4. The 'alloc' field should be populated with the account you generated at the provious step. To show the account use:
```console
ls node1/keystore
```

5. Generate node key and copy it into geth (for newest versions of geth) dir of node1 folder
```console
bootnode --genkey=nodekey
mkdir node1/geth
mv nodekey node1/geth/
```

6. Create enode id of node1
```console
bootnode --nodekey=node1/nodekey --writeaddress > node1/enode
cat node1/enode
```

7. Create .TOML configuration file
```console
geth --nodiscover --verbosity 5 --networkid 31337 --http --http.addr 0.0.0.0 --http.port 22000 --http.api admin,eth,debug,miner,net,txpool,personal,web3 --port 21000 dumpconfig > conf.toml
```

8. Populate 'BootstrapNodes' field with the enode id created at step 6. Address needs also to specify the ports that are going to be used for devp2p and raft. See example below:
```json
BootstrapNodes = ["enode://NODEID_CREATED_AT_STEP_6@127.0.0.1:21000?discport=0&raftport=50000"]
```

9. Initialize the node
```console
geth --datadir node1 init genesis.json
```

10. Start node by running the startNetwork.sh script:
```console
./startNetwork.sh
```

11. Attach to node
```console
geth attach node1/geth.ipc
```
or
```console
geth attach http://127.0.0.1:22000
```