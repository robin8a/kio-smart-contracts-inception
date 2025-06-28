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
