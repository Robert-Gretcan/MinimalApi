# Use the official Python image as the base
FROM python:3.11-slim

# Set the working directory
WORKDIR /locust

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the Locust test script
COPY loadtest.py loadtest.py

# Expose the Locust web interface port
EXPOSE 8089

# Command to run Locust
CMD ["locust", "-f", "loadtest.py", "--host=http://productapi:8080"]