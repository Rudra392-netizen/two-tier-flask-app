# Use a slim Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install system dependencies first (mysqlclient needs them)
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirement file
COPY requirements*.txt ./

# Install Python dependencies (mysqlclient will work now)
RUN pip install -r requirements.txt

# Copy application code
COPY . .

# Expose the port your Flask app runs on
EXPOSE 5000

# Set environment variables
ENV app_host="0.0.0.0" \
    app_port="5000"
# Run the app
CMD ["python", "app.py"]

# Metadata labels
LABEL CREATOR="Rudra" \
      VERSION="1.0" \
      DESCRIPTION="This is a two-tier Flask application with a MySQL database"
