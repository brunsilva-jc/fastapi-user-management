#!/bin/bash

# FastAPI User Management - Setup Script
# This script sets up the Python environment and installs dependencies

echo "🚀 FastAPI User Management - Environment Setup"
echo "=============================================="

# Check if python3-venv is installed
if ! dpkg -l | grep -q python3-venv; then
    echo "❌ python3-venv is not installed. Please run:"
    echo "   sudo apt-get update && sudo apt-get install -y python3-venv python3-pip"
    echo "   Then run this script again."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "✅ Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "📦 Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "📦 Installing dependencies..."
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo ""
echo "To start working, run:"
echo "  source venv/bin/activate"
echo ""
echo "To start PostgreSQL (if using Docker):"
echo "  docker-compose up -d"
echo ""
echo "To run the application:"
echo "  uvicorn main:app --reload"
echo ""