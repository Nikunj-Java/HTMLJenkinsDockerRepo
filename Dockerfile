## Use the Official NGinx Image from Docker HUB
FROM nginx:alpine

## Copy HTML file to NGInx server Public Directory
COPY . /usr/share/nginx/html

## EXPOSE the service on PORT 80 to host website
EXPOSE 80