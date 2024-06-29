# Use Python 3.9 base image
FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy requirements.txt file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Upgrade the 'six' library if needed
RUN pip install --upgrade six

# Expose port 5000 to the outside world
EXPOSE 5000

# Copy all files from the current directory to the container's /app directory
COPY . .

# Set the FLASK_APP environment variable to point to your application
ENV FLASK_APP=http/app.py

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
