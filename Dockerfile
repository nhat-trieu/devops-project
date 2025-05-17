FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
COPY Project_BanSach-20250515T063933Z-1-001/Project_BanSach/Project_BanSach/publish/ .
ENTRYPOINT ["dotnet", "Project_BanSach.dll"]

