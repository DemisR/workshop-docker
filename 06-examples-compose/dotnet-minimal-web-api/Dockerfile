FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
# Copy everything
COPY . .
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o published-app

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /app
COPY --from=build /app/published-app .
ENTRYPOINT ["dotnet", "NotesMinimalAPI.dll"]

