FROM amazoncorretto:21-alpine-jdk


# Install tooling from ubuntu packages
RUN apk update && apk add postgresql-client

#Adding bash
RUN apk add --no-cache bash

#Adding curl as well
RUN apk add curl

#adding nslookup, dig and others
RUN apk add bind-tools

# Create a non-root user and group with a numeric UID and GID
RUN addgroup -g 1001 appgroup && adduser -u 1001 -G appgroup -S appuser

# Set the working directory and copy files
WORKDIR /app
COPY . /app

# Set the correct ownership for the app directory
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER 1001

# Keep the container running indefinitely
CMD ["sleep", "infinity"]
