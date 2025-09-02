FROM ubuntu:20.04

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Set work directory
WORKDIR /opt

# Copy requirements and install them
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy the whole project (app.py + templates + static)
COPY . .

# Run Flask app
ENTRYPOINT ["python3", "app.py"]

