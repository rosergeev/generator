# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine as build-env

WORKDIR /api
ENV ASPNETCORE_URLS=http://+:80

COPY api.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o /publish


# Runtime image stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as runtime-env
WORKDIR /publish
COPY --from=build-env /publish .
ENTRYPOINT [ "dotnet", "api.dll" ]