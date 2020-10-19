# QUORUM NETWORK #

## Introduction ##
This repository contains a set of examples created using the Quorum framework.

## How to setup DEVENV ##

### MacOS or Linux instructions ###

#### Install brew ####
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
#### Install geth ####
```console
brew tap ethereum/ethereum
brew install ethereum
```

#### Install golang ####
```console
brew install golang
```

#### Install Quorum ####
```console
git clone https://github.com/ConsenSys/quorum.git
cd quorum
make all
export PATH=$(pwd)/build/bin:$PATH
```

### Useful links ###

#### Ethereum JavaScript Console ####
https://geth.ethereum.org/docs/interface/javascript-console

#### Interact with nodes ####
https://geth.ethereum.org/docs/interface/peer-to-peer
