FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

WORKDIR /src

RUN apt-get update && apt-get install -y nodejs jq && rm -rf /var/lib/apt/lists/*

COPY . .
# Product version (the extension passes the image tag). Flexygo reads it from the assembly to
# know which <Product>.Conf.Database package to install; without it the app says 1.0.0.
ARG VERSION=1.0.0
RUN dotnet publish flxCatalog.Frontend/flxCatalog.Frontend.csproj -c Release -o /app/publish -p:Version=${VERSION} \
 && find /app/publish/conf -maxdepth 1 -iname 'appsettings.*.json' ! -iname 'appsettings.json' -delete \
 && jq 'del(.Kestrel) | .BackendEndpoint = "http://flxCatalog-backend:8080/api/backend/"' /app/publish/conf/appsettings.json > /tmp/appsettings.json \
 && mv /tmp/appsettings.json /app/publish/conf/appsettings.json

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

WORKDIR /app
COPY --from=build /app/publish ./
ENTRYPOINT ["dotnet", "flxCatalog.Frontend.dll"]
