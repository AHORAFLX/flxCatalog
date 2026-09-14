#!/bin/bash

DLL="$1"

if [ -z "$DLL" ]; then
  echo "ERROR: No se especifico la DLL a ejecutar."
  exit 1
fi

if [ -n "$MSSQL_SA_PASSWORD" ]; then
  sed -i "s/Password=[^;]*/Password=$MSSQL_SA_PASSWORD/g" ./conf/appsettings.json
fi

exec dotnet "$DLL"
