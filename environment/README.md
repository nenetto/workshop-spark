# Environment
- Contenedor base de Ubuntu (ubuntu:14.04)
- Contenedor oficial de Spark (2.3.1)

- El docker-compose.yml arrancará el entorno estrictamente necesario

## Build images:
- `./build_images.sh`, script que construye las imagenes de docker, puede llevar un tiempo la construcción (15 min.).

## Listado de imagenes construidas:
```sh
docker images
```

## Eliminación de una imagen de docker:
```sh
docker rmi [image-id]
```

## Arranque del entorno:

```sh
docker-compose -f docker-compose.yml up -d
```

## Parada del entorno
```sh
docker-compose down
```

## Eliminación de los contenedores una vez parados
```sh
docker rm $(docker ps -a -q)
```

## Parada(en caso de estar arrancados) y eliminación de los contenedores
```sh
docker-compose stop [container-id]
```

## Parada(en caso de estar arrancados) y eliminación de los contenedores
```sh
docker rm [container-id]

docker rm --force [container-id]
```

## Comprobación del estado de los contenedores en funcionamiento.
```
docker ps
```

## Comprobación del estado de TODOS los contenedores.
```
docker ps -a
```

## Revisar logs de docker.
```
docker logs [container-name] 
```

## Copiar un fichero a un contenedor docker 
```
docker cp Desktop/python_job.py mycontainer:/python_job.py
```
## meterse en el nodo master de Spark
```
docker exec -it master /bin/bash
```

## ejecutar un job estando dentro del nodo master
```
spark-submit \
--conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:/tmp/data/log4j.properties" \
--conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:/tmp/data/log4j.properties" \
--class com.sgae.SparkProcess \
--master spark://master:7077 \
/tmp/data/python_job.py [parameters]
```



