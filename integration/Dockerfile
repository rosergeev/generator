FROM mcr.microsoft.com/dotnet/sdk:latest
WORKDIR /integration

COPY integration.csproj .
RUN dotnet restore

COPY . .
ENTRYPOINT [ "dotnet", "test" ]