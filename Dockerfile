FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["MinimalApiDemo.csproj", "./"]
RUN dotnet restore "MinimalApiDemo.csproj"
COPY . .
RUN dotnet build "MinimalApiDemo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MinimalApiDemo.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Expose the port
EXPOSE 8080
# Run the application
ENTRYPOINT ["dotnet", "MinimalApiDemo.dll"]