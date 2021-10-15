# Infraestructura (Cardado)

- Pool Moxie pool (1 año operando)(https://moxietech.co/)

# Estudios y grupos de interes (Smart Contracts)
- Plutus pioneer program (Enero a Marzo 2021)
- Plutus-Haskell course (European Business University of Luxembourg: Octubre 2021 hasta hoy)

# Dapp (Decentralized Application) (MVP )
## Nodo de Cardano ( mes) 
- Seguridad sobre(OS Ubuntu) y Redes (100%): para evitar ataques externos se habilitaron puertos no comunes para las conexiones externas vía SSH, tablas de enrutamiento, usuarios con privilegios minimos.
- Configuración Testnet/Mainnet (100%): usamos la Testnet para realizar las pruebas ya que es mas pequeña, para posteriormente probar sobre Mainnet que es mucho mas grande y contiene una copia de la Blockchain real. 
- Actualizaciones (Eras Shelley a Gougen) (100%): Ya que Cardano es un proyecto en continuo crecimiento y cambio es necesario actulizarlo a las última versión, por ejemplo se actualizo a la version que soporta contratos inteligentes.
- Cardano Wallet API (Envío comandos para interactuar sobre la blockchain, https://input-output-hk.github.io/cardano-wallet/api/edge/) (100%) Permite realizar operaciones de lectura y escritura sobre la Blockchain, por ejemplo el reloj.
- DB Sync (Consultas sobre la blockchain) (100%): Permite hacer consulta SQL sobre una base de datos Postgress que contiene una copia actualizada de la Blockchain
- Integración AWS IoT (Envío remoto sobre la infraestructura de AWS IoT para el envío de comandos y respuestas Pub/Sub) (100%), haciendo uso del protocolo MQTT de mensajería; publicador y subscriptor (Pub/Sub) para escuchar los mensajes en el Nodo donde se ejecutan los comandos y se devuelve la respuesta a la interfaz gráfica
- Desarrollo del API (Python) para la ejecución de los comandos provenientes de la interfaz gráfica (25%)
- Contratos Inteligentes (0%): Plutus es la plataforma de contratos inteligentes para Cardano, los contratos de Plutus consisten de partes que corren sobre la blockchain que son ejecutan dependiendo de las entradas y como consecuencia genera salidas. Lo anterior se contruye con el lenguaje funcional Haskell. Una persona participo en el grupo de pioneros y ahora estamos haciendo un curso.
  
## Funcionalidades
- Query tip (100%): Este comando permite saber el estado del nodo, con el fin de hacer un Keep-Alive del nodo
- Creación Wallet (100%): Se crean las billetera directamente en el nodo para hacer transacciones y pago de las mismas. 
- Creación de Token con 
- Mintiado de NFT (100%): Esta funcionalidad permite crear Token no fungibles, como imagenes únicas asignadas a una billetera que se encuentra asociada a un persona. Las imagenes son únicas y se esta usando para obras digitales.
  - Integración IPFS (InterPlanetary File System): Es un sistema para compartir archivos 
  - Politicas minteo
  - Estructuración del metadata
- Creación de Tokens (100%)

## Front-End (React JS) Serverless SPA (Single Page App):
La interfaz gráfica se contruyo haciendo uso de React JS y AWS amplify que tiene varios módulos:

- Autenticación y Autorización: registro e inicio de sesión con los privilegios según el rol del usuario
- AWS IoT (Pub/Sub)
- API (AWS DynamoDB, AppSync): Crear, Leer, Actualizar, Borrar, Listar, escuchar cuando cambia: elementos de la base de datos 
- Gestión de archivos: Subir y bajar archivos en un repositorio
- Llamado a través de APIs de Inteligencia Artificial
- Integración y despliegue continuo: cada vez que se hace un cambio en el código se puede ver reflejado en las ramas de desarrollo y producción
- 

# Roadmap
- Dashboard con API y DB Sync: Haciendo uso del API Wallet y consultas a las base de datos construir dashboard y reportes necesario para la administración de la plataforma
- Desarrollo continuo del API (Python): Se hizo el intento de desarrollo con NodeJs/Typescript pero hubo problemas de confiabilidad con el llamado de las transacciones y mensajes repetidos. Python fue el lenguaje que es mas estable y funciona correctamente.
- Contratos Inteligentes (No en el MVP)

 # Recursos Invertidos al día de hoy
USD 24.000
