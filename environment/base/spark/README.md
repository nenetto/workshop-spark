# Spark

Es el framework en el que nos apoyaremos para la parte de procesamiento de datos.

Spark nos permite escribir nuestro código y luego empaquetarlo en un archivo ".jar" para poder lanzar el job de procesamiento.

##Construcción

```
sbt compile
```

##Empaquetado

```
sbt package
```

##Assembly

Esta instrucción se utiliza para comprimir, en un único .jar, nuestro código y todas las librerías necesarias.

```
sbt assembly
```
Assembly sin ejecutar los test

```
sbt 'set test in assembly := {}' clean assembly
```

## test

```
sbt test
```

# Ejecutar un job

Primero copia todo **assembly** jar al volumen de spark

```
cp ProcesamientoSGAE/target/scala-2.11/*assembly*.jar environment/data/sgae_poc.jar
```


# Logs

Copia la configuracion al volumen correspondiente de spark

```
cp ProcesamientoSGAE/src/main/resources/log4j.properties environment/data/log4j.properties
```

ejecuta el job ahora

```
docker exec -it master /bin/bash

spark-submit \
--conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:/tmp/data/log4j.properties" \
--conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:/tmp/data/log4j.properties" \
--class com.sgae.SparkProcess \
--master spark://master:7077 \
/tmp/data/sgae_poc.jar [parameters]

```


Logs son generados cada minuto

Logs tienen el siguiente formato

```
timestamp LOG_LEVEL classNameWhereLogIsInserted:lineNumberInFileWhereLogIsInserted - description
```

## Location

###Master

Encontrar los logs en el master: carpeta donde estes ejecutando el programa > file "SGAEPoc-*.log".

### Workers

Encontrar los logs en los workers

```
docker exec -it worker_1 /bin/bash

 find / -name "SGAEPoc-*.log" 
```

