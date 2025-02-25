# Use Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy everything, including templates/
COPY . /app


# create dir
RUN mkdir -p /app/temp
# Install dependencies
RUN pip install -r require.txt

# Expose port
EXPOSE 5000

# Run the Flask app here -u is used run the container continously unbuffered
CMD ["python", "-u", "app.py"]
