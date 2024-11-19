# Base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the application script
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the application port
EXPOSE 4499

# Entry point for the container
CMD ["/app/wisecow.sh"]

