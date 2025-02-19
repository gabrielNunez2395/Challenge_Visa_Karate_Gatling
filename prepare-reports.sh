#!/bin/bash

# Obtener el último directorio generado por Gatling
LAST_GATLING_REPORT=$(ls -dt target/gatling/*/ | head -n 1)

echo "Último reporte de Gatling: $LAST_GATLING_REPORT"

# Crear carpeta fija
FIXED_GATLING_REPORT_DIR="target/gatling-report"

# Limpiar cualquier reporte anterior
rm -rf "$FIXED_GATLING_REPORT_DIR"

# Copiar el último reporte a la carpeta fija
cp -r "$LAST_GATLING_REPORT" "$FIXED_GATLING_REPORT_DIR"

echo "Reporte de Gatling copiado a $FIXED_GATLING_REPORT_DIR"