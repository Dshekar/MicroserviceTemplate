# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy project files
COPY ./source/WebApi/*.csproj ./WebApi/
RUN dotnet restore ./WebApi/WebApi.csproj

# Copy all files and build
COPY ./source ./source
WORKDIR /app/source/WebApi
RUN dotnet publish -c Release -o /out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Set memory limit for .NET runtime
ENV DOTNET_GCHeapHardLimit 300000000

# Set the ASP.NET Core environment to Development
ENV ASPNETCORE_ENVIRONMENT=Development

# Expose port
EXPOSE 80
ENTRYPOINT ["dotnet", "WebApi.dll"]
