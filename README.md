# FastAPI User Management

[![FastAPI](https://img.shields.io/badge/FastAPI-0.104.1-009688.svg?style=flat&logo=FastAPI&logoColor=white)](https://fastapi.tiangolo.com)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-316192.svg?style=flat&logo=postgresql&logoColor=white)](https://www.postgresql.org)
[![Python](https://img.shields.io/badge/Python-3.8+-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org)
[![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.0-D71F00.svg?style=flat)](https://www.sqlalchemy.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, production-ready FastAPI service for user management with PostgreSQL database integration. This service demonstrates best practices for building RESTful APIs with FastAPI, including database ORM, environment configuration, and containerization.

## 🚀 Features

- **FastAPI Framework** - High-performance async web framework
- **PostgreSQL Database** - Robust, production-ready database
- **SQLAlchemy ORM** - Database abstraction and query builder
- **Docker Support** - Containerized PostgreSQL for easy development
- **Environment Configuration** - Secure credential management with `.env` files
- **Auto-documentation** - Interactive API docs with Swagger UI
- **Random User Integration** - Fetches random user data from external API
- **Data Validation** - Email uniqueness and input validation

## 📋 Prerequisites

- Python 3.8 or higher
- Docker and Docker Compose (for containerized PostgreSQL)
- PostgreSQL 12+ (if running locally without Docker)

## 🛠️ Installation

### 1. Clone the repository

```bash
git clone https://github.com/brunsilva-jc/fastapi-user-management.git
cd fastapi-user-management
```

### 2. Create virtual environment

```bash
python -m venv venv

# On Windows
venv\Scripts\activate

# On Unix or MacOS
source venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

```bash
cp .env.example .env
```

Edit `.env` file with your database credentials:

```env
DATABASE_URL=postgresql://postgres:password@localhost:5432/userservice
```

### 5. Start PostgreSQL

#### Option A: Using Docker (Recommended)

```bash
docker-compose up -d
```

This will start PostgreSQL on port 5432 with:
- Username: `postgres`
- Password: `password`
- Database: `userservice`

#### Option B: Local PostgreSQL

1. Install PostgreSQL on your system
2. Create a database:
```sql
CREATE DATABASE userservice;
```
3. Update the `.env` file with your credentials

## 🚀 Running the Application

### Development mode

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Production mode

```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

The API will be available at: `http://localhost:8000`

## 📚 API Documentation

Once the application is running, you can access:

- **Swagger UI**: [http://localhost:8000/docs](http://localhost:8000/docs)
- **ReDoc**: [http://localhost:8000/redoc](http://localhost:8000/redoc)

### Available Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Health check - returns API status |
| GET | `/get_users` | Retrieve all users from database |
| POST | `/add_user` | Fetch random user from external API and store |

### Example Requests

#### Health Check
```bash
curl http://localhost:8000/
```

Response:
```json
{
  "message": "User API is running"
}
```

#### Get All Users
```bash
curl http://localhost:8000/get_users
```

Response:
```json
{
  "users": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john.doe@example.com"
    }
  ]
}
```

#### Add Random User
```bash
curl -X POST http://localhost:8000/add_user
```

Response:
```json
{
  "message": "User added",
  "name": "Jane Smith",
  "email": "jane.smith@example.com"
}
```

## 🗄️ Database Schema

### Users Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | INTEGER | PRIMARY KEY, AUTO INCREMENT |
| name | VARCHAR | NOT NULL |
| email | VARCHAR | UNIQUE, NOT NULL, INDEXED |

## 🏗️ Project Structure

```
fastapi-user-management/
├── main.py              # FastAPI application and routes
├── models.py            # SQLAlchemy database models
├── database.py          # Database connection and configuration
├── requirements.txt     # Python dependencies
├── docker-compose.yml   # Docker configuration for PostgreSQL
├── .env.example        # Environment variables template
├── .env                # Local environment variables (not in git)
├── .gitignore          # Git ignore configuration
└── README.md           # Project documentation
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| DATABASE_URL | PostgreSQL connection string | `postgresql://postgres:password@localhost:5432/userservice` |

### Docker Compose Configuration

The `docker-compose.yml` file configures:
- PostgreSQL 15 Alpine (lightweight)
- Persistent volume for data
- Health checks
- Network isolation

## 🚦 Testing

### Run with test data

```bash
# Start fresh database
docker-compose down -v
docker-compose up -d

# Run application
uvicorn main:app --reload

# Add test users
for i in {1..5}; do curl -X POST http://localhost:8000/add_user; done

# Verify users
curl http://localhost:8000/get_users
```

## 📈 Performance

- **Async Support**: FastAPI's async capabilities for high concurrency
- **Connection Pooling**: SQLAlchemy connection pool for database efficiency
- **Indexed Queries**: Email field indexed for fast lookups
- **Lightweight Container**: Alpine-based PostgreSQL image

## 🔒 Security Considerations

- Environment variables for sensitive data
- Parameterized queries prevent SQL injection
- Email uniqueness validation
- `.gitignore` configured to exclude sensitive files

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [FastAPI](https://fastapi.tiangolo.com/) - The modern, fast web framework
- [SQLAlchemy](https://www.sqlalchemy.org/) - The Python SQL toolkit
- [Random User API](https://randomuser.me/) - Random user data generator
- [PostgreSQL](https://www.postgresql.org/) - The world's most advanced open source database

## 📮 Contact

Bruno Silva
Email: brunsilva-jc@gmail.com

Project Link: [https://github.com/brunsilva-jc/fastapi-user-management](https://github.com/brunsilva-jc/fastapi-user-management)

---

⭐ If you find this project useful, please consider giving it a star!
