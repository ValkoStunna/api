# Use an official Node.js runtime as a base image
FROM node:18

# Set environment variables
ENV DATABASE_URL mongodb://mongodb
ENV DATABASE_PORT 27017
ENV MQTT_URL mqtt://mosquitto
ENV MQTT_PORT 1883

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]