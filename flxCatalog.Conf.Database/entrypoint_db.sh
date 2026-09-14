#!/bin/bash

CONF_DB="${CONF_DBNAME:-flxCatalog_IC}"
DATA_DB="${DATA_DBNAME:-flxCatalog_I}"

/opt/mssql/bin/sqlservr &

echo "Esperando a que SQL Server inicie..."
until sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT 1" > /dev/null 2>&1; do
    sleep 1
done

echo "SQL Server esta listo."

attach_db() {
    local db="$1"
    local exists

    exists=$(sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -h -1 -W -Q "SET NOCOUNT ON; SELECT name FROM sys.databases WHERE name = '$db';" | tr -d '[:space:]')

    if [ "$exists" == "$db" ]; then
        echo "La base de datos $db ya esta restaurada. No se hara nada."
        return 1
    fi

    local mdf_src="/tmp/db/$db.mdf"
    local ldf_src="/tmp/db/$db.ldf"
    local mdf_dst="/var/opt/mssql/data/$db.mdf"
    local ldf_dst="/var/opt/mssql/data/$db.ldf"

    if [ ! -f "$mdf_src" ] || [ ! -f "$ldf_src" ]; then
        echo "La imagen no incluye ficheros para $db, se omite."
        return 1
    fi

    echo "Restaurando base de datos $db..."
    mv "$mdf_src" "$mdf_dst"
    mv "$ldf_src" "$ldf_dst"

    echo "Adjuntando base de datos $db..."
    sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "
    CREATE DATABASE [$db]
    ON (FILENAME = N'$mdf_dst'),
       (FILENAME = N'$ldf_dst')
    FOR ATTACH;"

    return 0
}

if attach_db "$CONF_DB"; then
    /opt/mssql-tools/bin/sqlcmd -S localhost -d "$CONF_DB" -U sa -P "$MSSQL_SA_PASSWORD" -Q "UPDATE aspnetusers SET MustChangePassword=1 WHERE username='Admin';"
fi

attach_db "$DATA_DB"

touch /tmp/db-ready

wait
