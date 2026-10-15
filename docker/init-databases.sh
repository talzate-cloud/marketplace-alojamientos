#!/bin/bash
set -e
for svc in identidad alojamientos disponibilidad cotizacion reservas pagos notificaciones resenas auditoria reportes; do
  psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -c "CREATE USER ${svc}_user WITH PASSWORD '${POSTGRES_PASSWORD}';"
  psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -c "CREATE DATABASE ${svc}_db OWNER ${svc}_user;"
done
