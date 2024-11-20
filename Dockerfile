# Start by pulling a base image with Python 3.11.3
FROM laudio/pyodbc:2.1.0

# Switch working directory
WORKDIR /app

# Copy the requirements file to the /app directory in the container
COPY requirements.txt /app/

# Install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# Copy everything from the current directory into the /app directory in the container
COPY . /app

# Expose the port Streamlit will run on
EXPOSE 8501

# Set the entrypoint to run Streamlit
ENTRYPOINT ["streamlit", "run", "chat.py", "--server.port=8501", "--server.address=0.0.0.0"]