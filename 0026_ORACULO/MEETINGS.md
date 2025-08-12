# TerraSacha Oráculo

## 10 Junio, 2025

- Versionamiento, semantica
- Enfasis en los errores de validación

### Hitos

- IoT
- Multimodelos
- Ux/UI
- Ajustes de BE - APIs

### Modelo de gráfico de Unimodelo

- S3 con versionamiento
- Tres archivos que se corren en la aplicación
- Historial de BC, version hashado
- Proceso de aprobación de un modelo (estados)

### Actual (API)

![Modelo actual](./_images/Cálculo%20Biomasa%20por%20imágenes%20satelitales%20-%20visual%20selection.svg)

Cálculo Biomasa por imágenes satelitales

1. filtro: fechas, satelites, poligonos
2. Selecciona imágen según el filtro
3. Exporta la imágena S3
4. Repite el proceso 1, 2 y 3 para la imagen posterior (anterior: 2024) y  (posterior: 2025)
5. FrontEnd dispara: Modelo Biomasa usa (anterior, posterior)
6. Guarda los en MySQL y muestra los resultados, historial de consultas
7. Consultas de API ext, validación manual, ajustan parametros
7.1 Consulta aprobada y validada se registra en la blockchain (JSON) (Dynamo)

### Deseado

> Modelo

1. Creación del modelo en Jupyter (documenta) (acceso S3 de las imágenes)
2. Proceso de aprobación (desarrollo, aprobado)
3. Despliegue del modelo

> FE

1. filtro: modelo, fechas, satelites, poligonos, datos IoT
2. Selecciona imágen según el filtro
3. Exporta la imágena S3
4. Repite el proceso 1, 2 y 3 para la imagen posterior (anterior: 2024) y  (posterior: 2025)
5. FrontEnd dispara: Modelo Biomasa usa (anterior, posterior)
6. Guarda los en MySQL y muestra los resultados, historial de consultas
7. Consultas de API ext, validación manual, ajustan parametros
7.1 Consulta aprobada y validada se registra en la blockchain (JSON) (Dynamo)

```json
{
    "imagen_ant": "s3//",
    "imagen_pos": "s3//",
    "param1": "p1",
    "param1": "p2",
    "paramN": "pN",

}
```

## 24 de Junio 2025

### Oraculo

```sh
curl -X GET https://0vhlizcpz0eq.manus.space/api/ndvi/health


curl -X POST https://0vhlizcpz0eq.manus.space/api/ndvi/calculate-ndvi \ 
-H "Content-Type: application/json" \
-d '{"red": 0.3, "nir": 0.8}'

```

- Entrenamiento, usuario promedio
- Uso de otro satelite
- Biomass, vamos hacer parte de la red. SAR, RAS sintético @luis_gomez
- Satelite => Baja la información (matriz-N-capas) => Misma estructura [ruta de satelites] (Julio fin año) (LIDAR)
- Procesamiento de imágenes de los drones. (Workstation SD) => Subir la capa útil

### KOBO en campo

- Conversión de voz a oráculo
- Herramienta de terminal movíl

## 15 de Julio, 2025

- [] APIs para una aplicación móvil
- Aplicación movil MVP: Poligono => como esta en NVDI de esta semana => Imagen Biomasa
- Accesorio: camara y GPS

## 22 de Julio, 2025

- Arboles de merker, datos no modificados
- [] @luis_restrepo: donde se guardaría las imágenes de GeoTIF, TIF y PNGs de los resultados del cálculo de Biomasa
- Oráculos centralizado
- Viviana reportó bajo conocimiento de Luis de oráculo.
- Cómo funcionaría el hash: cadena de bloques => por registro de datos (Servicio de Luis)
- [BlockChain] Qué vamos a registrar? Validación interna? Debe haber un validador? Se guarda solo el resultado, algunos datos? Definir un protocolo. Pregunta a PCI, Bitácora de procedimiento (herramienta de captura de datos por audio), los audios son útiles, archivos fuente. Guardar la imagen multiespectral (que pasa con los estandares).
- Como hacemos para cumplir con los estandares? [] reunión BCR, que necesitamos?
- Con el 1er producto, sentarnos con BCR (Jose Ricardo)
- Guardar por hitos
- IPFS tiene un costo adicional

### Interoperatividad

- Plataformas
- Interoperatividad entre cadenas de bloques?
- Oráculo como plataforma independiente
- Costos, monedas
- Quan, Algoran (competencia directa de Cardano). Interacción entre cadenas
- W3, Cardano implementa ISO2000-22 ventaja, estandarización: [El lenguaje Universal para el futuro de pagos](https://www.jpmorgan.com/content/dam/jpm/global/documents/iso-20022-spanish-white-paper-ada-compliant.pdf)
- Oráculos de Hardware Network XYO

### Ruta de testing y tiempos

## 29 Julio, 2025

- Permitir agregar nuevos satelites, (planet)
- [] Integración con sensores de drones
- [] Integración con las plataformas de los estándares. El estandar no hace enfasis , documentos finales de los resultados (resultado final) .pdf
- Biocarbon Register: como se integra. Historico del proyecto
- RENARE, detalle de N proyecto. GIS por capas. Verificar que no hay traslape de proyectos
- Trazabilidad de producto (proyecto en etapas tempranas)
- Socialización con Jose Ricardo
- Registro medidas asometricas (se guardan los audios)
- @william: Técnicas actuales (formlarios, fotos). Es un proceso mecánico. Toma => Almacenamiento => Transformación => Validación. Hablar con el estandar que necesita (cuál información queda?)
- Credibilidad, técnicas para evitar fraude. No uso de VPN, fiabilidad.
- @william: rol auditor, carpeta (predio => parcela => árbol #8 => verfican) hoja, foto, visita en sitio
- @william: crítico: garantizar la permanencia del carbono (talas después de la visita). Herramienta de monitoreo para solucionar éste problema. LiDAR puede detectar, gemelos digitales

## 05 de Agosto 2025

- depende model, no solo de biomasa
- perfil de usuario, limitando el numero de peticiones por usuarios
- @sergio, plan de sostenibilidad, uso racional, que se sostenga en el tiempo, consumo en la nube.

## 12 de Agosto, 2025

- Agregar en el registro, impactar n personas
- [] capturar la información Nombre de la persona y ubicación (Ej. por departamento). Conteo de usuarios. 220K @Viviana, que información requiere.
- [] Roles: Administrador, Investigador, Científico de Datos, Usuario Externo (registra), definir los roles @sergio. Tabla de roles (autorización/privilegios). Mirar como esta hecho en las plataformas
