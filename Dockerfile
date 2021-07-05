FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY "MVCprototipo.csproj" .
RUN dotnet restore "MVCprototipo.csproj"
COPY . .
RUN dotnet build . -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MVCprototipo.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet", "MVCprototipo.dll" ]

