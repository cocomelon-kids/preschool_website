# Stage 1: Build the frontend
FROM node:18 AS frontend-build

WORKDIR /app/frontend

# Copy frontend package.json and package-lock.json files
COPY frontend/package.json frontend/package-lock.json ./

# Install dependencies for the frontend
RUN npm install

# Copy the rest of the frontend source code and build it
COPY frontend/ ./

# Run the build process (this will generate the dist folder)
RUN npm run build

# Stage 2: Serve the frontend using an Nginx server
FROM nginx:alpine

# Copy the build output to the Nginx html folder
COPY --from=frontend-build /app/frontend/dist /usr/share/nginx/html

# Expose the port Nginx will run on
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
