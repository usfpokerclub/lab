FROM python:3.7-bullseye

# Create non-root user
RUN useradd -ms /bin/bash web

# Set working directory
WORKDIR /home/web

# Copy only what’s needed for pip install early (optimizes caching)
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gevent gevent-websocket

# Install Node.js 16
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs

# Copy rest of the app
COPY . .

# Build frontend
WORKDIR /home/web/client
RUN rm -rf node_modules build
RUN npm install
ENV PATH /home/web/client/node_modules/.bin:$PATH
RUN npm run build --openssl-legacy-provider

# Copy built frontend to Flask server static dir
WORKDIR /home/web
RUN cp -r client/build server/build

# Fix: Explicitly copy, make executable, and run gen-cert.sh
RUN chmod +x gen-cert.sh && ./gen-cert.sh

# Secure cert permissions
RUN chown web:web cert.* && chmod 644 cert.crt && chmod 600 cert.key

# Switch to non-root user
USER web
