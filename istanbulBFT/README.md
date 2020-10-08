# Istanbul BFT consensus #

## Introduction ##
A GoQuorum network that implements instambul BFT consensus algorithm.

### How to reproduce the example ###

1. Install Instambul Tools
```console
git clone https://github.com/ConsenSys/istanbul-tools.git
cd istanbul-tools
make
```

2. Create a working directory for each node
```console
mkdir node1 node2 node3
```

3. Change into the lead (whichever one you consider first) node’s working directory and generate the setup files for X initial validator nodes by executing
```console
istanbul setup --num X --nodes --quorum --save --verbose
```
This command will generate several items of interest: static-nodes.json, genesis.json, and nodekeys for all the initial validator nodes which will sit in numbered directories from 0 to X-1.

4. Update static-nodes.json to include the intended IP and port numbers of all initial validator nodes

5. In each node’s working directory, create a data directory called data, and inside data create the geth directory
```console
mkdir -p node0/data/geth
mkdir -p node1/data/geth
mkdir -p node2/data/geth
```

6. Generate initial accounts for any of the nodes in the required node’s working directory
```console
geth --datadir node0/data account new
geth --datadir node1/data account new
geth --datadir node2/data account new
```

7. To add accounts to the initial block, edit the genesis.json file in the lead node’s working directory and update the alloc field with the account(s) that were generated at previous step

8. Next we need to distribute the files created in part 4
```console
cp node0/genesis.json node1
cp node0/genesis.json node2
cp node0/static-nodes.json node0/data/
cp node0/static-nodes.json node1/data/
cp node0/static-nodes.json node2/data/
cp node0/0/nodekey node0/data/geth
cp node0/1/nodekey node1/data/geth
cp node0/2/nodekey node2/data/geth
```

9. Switch into working directory of lead node and initialize it
```console
cd nodeX
geth --datadir data init genesis.json
```

10. Start network by running the startNetwork.sh script:
```console
./startNetwork.sh
```

11. Attach to node
```console
geth attach node0/geth.ipc
```
or
```console
geth attach http://127.0.0.1:30300
```