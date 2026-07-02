FROM node:22-alpine

WORKDIR /app

# Copy package files (including package-lock.json for reproducible installs)
COPY package*.json ./

# Install dependencies from the lockfile
RUN npm ci 2>&1

# Copy source code
COPY . .

# Build TypeScript code
RUN npm run build 2>&1

# Start the server
CMD ["sh", "-c", "node dist/index.js 2>&1"] 