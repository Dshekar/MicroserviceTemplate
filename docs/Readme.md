# Clean Architecture Microservice Template

This project is a **Clean Architecture** microservice template built using .NET C#. It is designed to help you quickly scaffold a new microservice adhering to best practices for maintainability and scalability.

## Solution Structure
The solution consists of the following projects:

### 1. WebAPI
- **Responsibilities**: Acts as the entry point for client requests.
- **Key Components**:
  - Controllers
  - API Filters (e.g., exception handling, authorization)
  - Dependency injection configurations

### 2. Application
- **Responsibilities**: Contains business logic and use case definitions.
- **Key Components**:
  - Commands
  - Queries
  - Interfaces (for services used in business logic)
  - DTOs (Data Transfer Objects)

### 3. Infrastructure
- **Responsibilities**: Implements external services and application dependencies.
- **Key Components**:
  - Data access (e.g., Entity Framework Core repositories)
  - External API integrations
  - Logging providers
  - Email/SMS services

### 4. Domain
- **Responsibilities**: Encapsulates core business entities and rules.
- **Key Components**:
  - Entities
  - Value Objects
  - Domain Events
  - Aggregates

## Getting Started

### Prerequisites
- Install [.NET SDK](https://dotnet.microsoft.com/download)
- Install an IDE such as [Visual Studio](https://visualstudio.microsoft.com/) or [VS Code](https://code.visualstudio.com/)
- Set up a database for the microservice (e.g., SQL Server, PostgreSQL)

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. Restore NuGet packages:
   ```bash
   dotnet restore
   ```

3. Update `appsettings.json` in the WebAPI project with the required configuration (e.g., database connection string).

4. Apply database migrations (if applicable):
   ```bash
   dotnet ef database update --project Infrastructure
   ```

5. Run the application:
   ```bash
   dotnet run --project WebAPI
   ```

6. Access the API at `https://localhost:<port>`.

## Project Customization
This template is designed for flexibility and can be customized based on project requirements. You can:
- Add new projects for specific concerns (e.g., cross-cutting concerns like caching).
- Introduce additional layers like API Gateways or event-driven messaging.

## Technologies Used
- **Framework**: .NET 6/7
- **Database**: EF Core (replaceable with Dapper, MongoDB, etc.)
- **Testing**: xUnit, Moq
- **Dependency Injection**: Built-in .NET DI
- **Observability**: Integrations for logging and monitoring (e.g., Serilog, Application Insights)

## Recommended Practices
1. Adhere to **SOLID principles**.
2. Use **CQRS** (Command Query Responsibility Segregation) in the Application layer.
3. Keep domain logic independent of external frameworks.
4. Write unit tests for Application and Domain layers.
5. Implement integration tests for Infrastructure.

## License
This template is licensed under the [MIT License](LICENSE).

---

##docker command

Docker build:
docker build -t webapi-dotnet6-app .

Docker Run:
docker run -d --memory="300m" -p 8080:80 webapi-dotnet6-app

Docker Stats: 
docker stats <contianerId>

Docker logs:
docker logs -f <containerId>

Feel free to extend and modify this template to suit your requirements.

