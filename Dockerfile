# Install dependencies
FROM cirrusci/flutter:2.5.3 AS build-env

# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/app

# Copy the app files to the container
COPY . .

# Get App Dependencies
RUN flutter clean
RUN flutter pub get

# Build the app for the web
RUN flutter build web

#hosting the built web app
FROM nginx:1.16.0-alpine

COPY --from=build-env /usr/local/bin/app/build/web /usr/share/nginx/html

#fire up nginx
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
