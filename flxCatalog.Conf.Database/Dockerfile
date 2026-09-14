FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

WORKDIR /src
COPY . .
RUN dotnet build flxCatalog.Conf.Database/flxCatalog.Conf.Database.sqlproj -c Release -p:NetCoreBuild=true \
 && dotnet build flxCatalog.Data.Database/flxCatalog.Data.Database.sqlproj -c Release -p:NetCoreBuild=true

FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

RUN apt-get update && \
    ACCEPT_EULA=Y apt-get install -y curl apt-transport-https gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev unzip libunwind8 libicu66 libssl-dev && \
    ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd

RUN wget --no-check-certificate -q -O sqlpackage.zip https://aka.ms/sqlpackage-linux && \
    unzip -qq sqlpackage.zip -d /opt/sqlpackage && \
    chmod +x /opt/sqlpackage/sqlpackage && \
    chown -R mssql /opt/sqlpackage && \
    mkdir /tmp/db && \
    chown -R mssql /tmp/db

COPY --from=build /src/flxCatalog.Conf.Database/bin/Release/*.dacpac /tmp/db/
COPY --from=build /src/flxCatalog.Data.Database/bin/Release/*.dacpac /tmp/db/

COPY ./flxCatalog.Conf.Database/entrypoint_db.sh /app/entrypoint_db.sh

RUN sed -i 's/\r$//' /app/entrypoint_db.sh \
 && chmod +x /app/entrypoint_db.sh

ARG DBNAME=flxCatalog_IC
ARG DATA_DBNAME=flxCatalog_I
ARG DATADBNAME
ARG CONF_DACPAC=flxCatalog.Conf.Database.dacpac
ARG DATA_DACPAC=flxCatalog.Data.Database.dacpac

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=-CHANGE_me1234
ENV MSSQL_PID=Evaluation
ENV CONF_DBNAME=${DBNAME}
ENV DATA_DBNAME=${DATADBNAME:-${DATA_DBNAME}}

RUN /bin/bash -c "\
    (/opt/mssql/bin/sqlservr &) && \
    echo 'Esperando a que SQL Server inicie...' && \
    until sqlcmd -S localhost -U sa -P \"\$MSSQL_SA_PASSWORD\" -Q 'SELECT 1' > /dev/null 2>&1; do \
        sleep 1; \
    done && \
    echo 'SQL Server esta listo.' && \
    echo 'Publicando $CONF_DBNAME (configuracion)...' && \
    /opt/sqlpackage/sqlpackage \
        /a:Publish \
        /TargetTrustServerCertificate:True \
        /tsn:localhost \
        /tdn:$CONF_DBNAME \
        /V:CurrentDacVersion=1.0.0.0 \
        /V:OriginDatabaseName=NULL \
        /tu:sa \
        /tp:\$MSSQL_SA_PASSWORD \
        /p:IncludeCompositeObjects=True \
        /sf:/tmp/db/$CONF_DACPAC && \
    echo 'Publicando $DATA_DBNAME (datos)...' && \
    /opt/sqlpackage/sqlpackage \
        /a:Publish \
        /TargetTrustServerCertificate:True \
        /tsn:localhost \
        /tdn:$DATA_DBNAME \
        /tu:sa \
        /tp:\$MSSQL_SA_PASSWORD \
        /p:IncludeCompositeObjects=True \
        /sf:/tmp/db/$DATA_DACPAC && \
    pkill sqlservr"

RUN /bin/bash -c "\
    rm -rf /tmp/db /opt/sqlpackage && \
    mkdir -p /tmp/db && \
    for db in $CONF_DBNAME $DATA_DBNAME; do \
        echo \"Extrayendo ficheros de \$db...\" && \
        mv /var/opt/mssql/data/\${db}*.mdf /tmp/db/\${db}.mdf && \
        mv /var/opt/mssql/data/\${db}*.ldf /tmp/db/\${db}.ldf || exit 1 ; \
    done && \
    rm -rf /var/opt/mssql"

HEALTHCHECK --interval=10s --timeout=10s --start-period=60s --retries=12 \
    CMD [ -f /tmp/db-ready ] && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT 1" || exit 1

ENTRYPOINT ["/app/entrypoint_db.sh"]
