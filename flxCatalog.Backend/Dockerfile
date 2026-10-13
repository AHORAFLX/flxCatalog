FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

WORKDIR /src

RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*

COPY . .
# Product version (the extension passes the image tag). Flexygo reads it from the assembly to
# know which <Product>.Conf.Database package to install; without it the app says 1.0.0.
ARG VERSION=1.0.0
RUN dotnet publish flxCatalog.Backend/flxCatalog.Backend.csproj -c Release -o /app/publish -p:Version=${VERSION} \
 && find /app/publish/conf -maxdepth 1 -iname 'appsettings.*.json' ! -iname 'appsettings.json' -delete \
 && jq 'del(.Kestrel) | .FrontendEndpoint = "http://flxcatalog-frontend:8080" | .ConnectionStrings.ConfConnectionString = "Server=flxcatalog-db;Integrated Security=false;Initial Catalog=flxCatalog_IC;User ID=sa;Password=change_me;Encrypt=False;TrustServerCertificate=True" | .ConnectionStrings.DataConnectionString = "Server=flxcatalog-db;Integrated Security=false;Initial Catalog=flxCatalog_I;User ID=sa;Password=change_me;Encrypt=False;TrustServerCertificate=True"' /app/publish/conf/appsettings.json > /tmp/appsettings.json \
 && mv /tmp/appsettings.json /app/publish/conf/appsettings.json

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    libgssapi-krb5-2 \
    jq \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/publish ./

RUN mkdir -p /var/lib/flxcatalog/packages && \
    chown -R 1000:1000 /var/lib/flxcatalog

RUN sed -i 's/\r$//' /app/entrypoint_backend.sh \
    && chmod +x /app/entrypoint_backend.sh

ENTRYPOINT ["/app/entrypoint_backend.sh", "flxCatalog.Backend.dll"]
