# Lacchain

El desarrollo una primera version de un proyecto blockchain para tokenizar bonos de carbono bajo la cadena Lacchain

## References

- Install node: <https://lacnet.com/overview/>
- Developer: <https://docs.lacnet.com/?_gl=1*qgxuvj*_ga*MTQwMDM1MDc4OC4xNzMzODM4MDUw*_ga_VTQLZ8WS03*MTczMzgzODA1MC4xLjEuMTczMzgzODEwNC4wLjAuMA..&_ga=2.60920044.1193646859.1733838051-1400350788.1733838050>
- <https://help.coinbase.com/en/coinbase/getting-started/crypto-education/glossary/ethereum-virtual-machine>
- <https://aws.amazon.com/marketplace/pp/prodview-ec4tk6lxtl4xw>

## Ubuntu on AWS

## 1. Install Docker

- <https://docs.docker.com/engine/install/ubuntu/>

## 2. Install LACNet

- <https://docs.lacnet.com/en/Setup-Local-Node/Deploy-Using-Docker>

## 2.1 Install yarn

- Using the official Yarn repository: <https://www.hostinger.com/tutorials/how-to-install-yarn?utm_campaign=Generic-Tutorials-DSA|NT:Se|LO:CO-EN&utm_medium=ppc&gad_source=1&gclid=EAIaIQobChMI9dWwgJKligMVNaFaBR0P5hi4EAAYASAAEgIhdPD_BwE>

```sh
1  clear
    2  for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    3  sudo apt-get update
    4  sudo apt-get install ca-certificates curl
    5  sudo install -m 0755 -d /etc/apt/keyrings
    6  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    7  sudo chmod a+r /etc/apt/keyrings/docker.asc
    8  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    9    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   10  sudo apt-get update
   11  clear
   12  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   13  sudo docker run hello-world
   14  clear
   15  git clone https://github.com/LACNet-Networks/besu-networks
   16  sudo chmod -R 777 data
   17  cd ..
   18  docker-compose up -d
   19  ls
   20  ls -al
   21  clear
   22  cd ..
   23  ls
   24  pwd
   25  cd home/
   26  ls
   27  git clone https://github.com/LACNet-Networks/besu-networks
   28  sudo git clone https://github.com/LACNet-Networks/besu-networks
   29  ls
   30  cd besu-networks/
   31  cd ..
   32  cd besu-networks/docker/compose/local/writer1
   33  sudo chmod -R 777 data
   34  cd ..
   35  docker-compose up -d
   36  sudo apt install docker-compose
   37  docker-compose up -d
   38  clear
   39  docker-compose logs -f besu
   40  clear
   41  sudo chmod -R 777 data
   42  sudo sudo chmod -R 777 data
   43  pwd
   44  ls
   45  cd ~
   46  pwd
   47  ls
   48  cd besu-networks/docker/compose/local/writer1
   49  ls
   50  sudo chmod -R 777 data
   51  cd ..
   52  docker-compose up -d
   53  sudo docker-compose up -d
   54  docker compose up -d
   55  sudo docker compose up -d
   56  clear
   57  docker-compose logs -f besu
   58  sudo docker-compose logs -f besu
   59  clear
   60  cd ~
   61  git clone https://github.com/LACNetNetworks/samples.git
   62  sudo git clone https://github.com/LACNetNetworks/samples.git
   63  ls
   64  cd samples/
   65  cd local/
   66  yarn install
   67  sudo apt install cmdtest
   68  yarn install
   69  clear
   70  cd ~
   71  ls
   72  rm -rf samples/
   73  sudo git clone https://github.com/LACNetNetworks/samples.git
   74  cd samples/
   75  cd local/
   76  ls
   77  yarn install
   78  ls
   79  clear
   80  ls
   81  node changeGasLimit.js --gasLimit=10000000
   82  sudo apt install nodejs
   83  node changeGasLimit.js --gasLimit=10000000
   84  clear
   85  yarn install
   86  ls
   87  clear
   88  ls
   89  clear
   90  ls
   91  node changeGasLimit.js --gasLimit=10000000
   92  npm install
   93  sudo apt install npm
   94  clear
   95  node changeGasLimit.js --gasLimit=10000000
   96  yarn install
   97  clear
   98  sudo apt install -y nodejs npm
   99  nodejs --version
  100  npm --version
  101  sudo npm install -g yarn
  102  yarn --version
  103  yarn install
  104  clear
  105  ls
  106  node changeGasLimit.js --gasLimit=10000000
  107  ls
  108  yarn --version
  109  yarn install
  110  ls -al
  111  clear
  112  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  113  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  114  sudo apt update
  115  sudo apt install yarn
  116  sudo rm /etc/apt/sources.list.d/yarn.list
  117  ls
  118  cd ..
  119  ls
  120  cd local/
  121  yarn install
  122  sudo yarn install
  123  clear
  124  node changeGasLimit.js --gasLimit=10000000
  125  sudo poweroff
```

## Smart Contracts

- <https://docs.lacnet.com/en/Deploy-Contract/Hardhat>

```sh
root@ip-172-31-28-157:/home/ubuntu/my_project/contracts# npx hardhat compile
Downloading compiler 0.8.28
Compiled 3 Solidity files successfully (evm target: paris).

```

### error: reason: 'invalid provider'

- <https://ethereum.stackexchange.com/questions/153167/error-invalid-signer-or-provider-argument-signerorprovider-value-code-i>

```sh

root@ip-172-31-28-157:/home/ubuntu/samples/local# node changeGasLimit.js --gasLimit=10000000
/home/ubuntu/samples/local/node_modules/@ethersproject/logger/lib/index.js:238
        var error = new Error(message);
                    ^

Error: invalid provider (argument="provider", value={}, code=INVALID_ARGUMENT, version=wallet/5.7.0)
    at Logger.makeError (/home/ubuntu/samples/local/node_modules/@ethersproject/logger/lib/index.js:238:21)
    at Logger.throwError (/home/ubuntu/samples/local/node_modules/@ethersproject/logger/lib/index.js:247:20)
    at Logger.throwArgumentError (/home/ubuntu/samples/local/node_modules/@ethersproject/logger/lib/index.js:250:21)
    at new Wallet (/home/ubuntu/samples/local/node_modules/@ethersproject/wallet/lib/index.js:128:20)
    at Wallet.connect (/home/ubuntu/samples/local/node_modules/@ethersproject/wallet/lib/index.js:152:16)
    at file:///home/ubuntu/samples/local/changeGasLimit.js:22:17
    at ModuleJob.run (node:internal/modules/esm/module_job:195:25)
    at async ModuleLoader.import (node:internal/modules/esm/loader:336:24)
    at async loadESM (node:internal/process/esm_loader:34:7)
    at async handleMainPromise (node:internal/modules/run_main:106:12) {
  reason: 'invalid provider',
  code: 'INVALID_ARGUMENT',
  argument: 'provider',
  value: LacchainProvider {}
}

snap install geth
geth --rpc --rpccorsdomain * --rpcport 8545 --rpcapi personal,web3,eth,net

```

## Setting Up LACChain Besu on AWS Ubuntu

```sh
# ssh -i "ts-lacchain-besu-ubuntu.pem" ubuntu@ec2-44-211-124-151.compute-1.amazonaws.com

ssh -i "ts-lacchain-besu-ubuntu.pem" ubuntu@ec2-3-85-50-52.compute-1.amazonaws.com

scp -i /path/to/your/private_key.pem /path/to/your/local_file user@your_instance_public_ip_or_dns:/path/to/destination_on_instance

scp -i "ts-lacchain-besu-ubuntu.pem" jdk-11.0.26_linux-aarch64_bin.tar.gz ubuntu@ec2-3-85-50-52.compute-1.amazonaws.com

scp -i "ts-lacchain-besu-ubuntu.pem" jdk-11.0.26_linux-aarch64_bin.tar.gz ubuntu@ec2-3-85-50-52.compute-1.amazonaws.com:/home/ubuntu

/home/ubuntu

jdk-11.0.26_linux-aarch64_bin.tar.gz

ssh -i "ts-lacchain-besu-ubuntu.pem" ubuntu@ec2-44-201-255-241.compute-1.amazonaws.com

scp -i "ts-lacchain-besu-ubuntu.pem" ts-lacchain-besu-ubuntu.pem ubuntu@ec2-44-201-255-241.compute-1.amazonaws.com:/home/ubuntu



```

```sh
# List current Java alternatives: To see the Java alternatives that the system knows about, run:
sudo update-alternatives --config java


ansible-playbook -i inventory --private-key=//home/ubuntu/ts-lacchain-besu-ubuntu.pem -u ubuntu site-lacchain-writer.yml



wget https://www.python.org/ftp/python/3.13.0a5/Python-3.13.0a5.tgz

wget https://www.python.org/ftp/python/3.13.3/Python-3.13.3.tgz


tar -zxvf Python-3.13.3.tgz
cd Python-3.13.3
```
