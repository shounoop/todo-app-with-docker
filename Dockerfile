# Define the base image (Node.js)
FROM node

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the current directory to the working directory
COPY package*.json ./

# Install dependencies (production mode to optimize image size)
RUN npm install --production

# Copy remaining application files
COPY . .

ENV MYSQL_HOST=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=viettel
ENV MYSQL_DB=todos

# Set the default command to run the app
CMD [ "node", "src/index.js" ]

# Expose port 3000 for the app
# EXPOSE 3000