# Use a smaller base image for production (Alpine-based Node.js image)
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files to avoid unnecessary context
COPY package*.json ./

# Install app dependencies
RUN npm install --production  # Install only production dependencies to reduce size

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app (assuming it needs to be built before running)
RUN npm run build

# Expose the port that the app will run on (adjust if needed)
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
