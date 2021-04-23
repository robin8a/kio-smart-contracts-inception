# Nodo Cardano (testing)

## Configuracion de VM en contabo.com
- Costo mensual $7USD $43.000 COP
- Ubuntu 20.04
- 
rochoa

## Admon de la maquina (1000 veces) 
- Actualizacion
- Seguridad
- Puertos
- usuarios
- carpetas
- llaves token ppk
- habilitar 
- Puertos del nodo
- Habilitar del firewall y puertos
- Descarga de los script
- Ejecución de scritps (conf: Testnet)
- 



```sh
144.91.83.151

chmod 400 ~/.ssh/id_rsa

ssh -i location/file.ppk username@server-ip

ssh -i cardano-token.ppk rochoa@144.91.83.151 -p 3006

ssh -i cardano-token.pem rochoa@144.91.83.151 -p 3006

ssh

```

## Creación Wallet 
- Pedir Adas para hacer pruebas ya que tiene un costo sobre la testnet
- Configuracion de las varibles "common.inc" de la carpeta de git
- Correr los scripts que genenra addr, llave publica y privada
- Solicitar des Faucet las adas (1000 se asignaron)

## No de Cardano

## Crear la politica para los cargos por transaccion
- 3 llaves
- 1. plata
- las dos para las politicas de minados
- Programar la politicas de minado, ejemplo el epoch para que no se permita generar mas tokens
- Aceptamos cualquier cripto Bitcoin, Ethereum, 
- De cripto - a lote, personal, costos
- Todo se mueva en el mundo cripto
- Se reduce el expre
- Alguien en china puede invertir, si tiene para invertir
- Generacion de policitas "cande", llave publica y privada (se verifican los tokens que estan en la block-chain)

## Trasaction
El objetivo es crear un FE que permita mintiar Token
- tomas info hash de la tx
- policy id
- calcula (mint fee es 0)
- generacion .raw (mint fee real) y lo pone en la tx
  - hace el calculo (lovelace)
- firma la tx llve de pago, politica (genera un nuevo archivo firmado)
- envia la tx a la block  (submit tx)

```sh
acdc wallet
token cande
```


## Crear nuestra propia API IPFS (ToDo)
- Ex. piñata
- Se sube el archivo (imagen, .pdf, .md)
- Distribuye p2p
- Genera el hash 
- 
### Politicas Generar Tokens
- Token nativos
- 
- Para firmar la transaccion se puede crear una politica de minado Ex. 3 (2 de 3, de minar o crear tokens concenso)
- Any, alLeast (require 2), slot (cierto numero se alcance)