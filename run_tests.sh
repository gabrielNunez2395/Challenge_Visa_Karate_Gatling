#!/bin/bash

echo "Ejecutando pruebas de Karate y Gatling en paralelo..."

# Ejecutar Karate en segundo plano
mvn test &
PID_KARATE=$!

# Ejecutar Gatling en segundo plano
mvn gatling:test &
PID_GATLING=$!

# Esperar a que ambos finalicen
wait $PID_KARATE
echo "Karate finalizado con código $?"

wait $PID_GATLING
echo "Gatling finalizado con código $?"

echo "Ejecución de pruebas finalizada."