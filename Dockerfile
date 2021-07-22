# build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-dev

WORKDIR /generator

# restore
COPY generator/api/api.csproj ./api/
RUN dotnet restore api/api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# copy src
COPY . .

# test
RUN dotnet test tests/tests.csproj

# publish
RUN dotnet publish generator/api/api.csproj -o /publish

# runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine
WORKDIR /publish
COPY --from=build-dev /publish .
ENTRYPOINT [ "dotnet", "api.dll" ]

