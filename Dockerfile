FROM python:3.11-slim

# Build argument for port with default value
ARG PORT=8001
ENV PORT=${PORT}

WORKDIR /app

# Copy the application code
COPY . .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port from build argument
EXPOSE ${PORT}

# Command to run the application
CMD ["sh", "-c", "uvicorn mcp_agent_army_endpoint:app --host 0.0.0.0 --port ${PORT}"]
