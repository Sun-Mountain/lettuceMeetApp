# stage1 as builder
FROM node:lts-alpine as builder

WORKDIR /lettuce-meet-frontend

# Copy the package.json and install dependencies
COPY package*.json ./
RUN yarn install

# Copy rest of the files
COPY . .

# Build the project
RUN yarn build


FROM nginx:alpine as production-build
COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stage 1
COPY --from=builder /lettuce-meet-frontend/dist /usr/share/nginx/html

EXPOSE 5173
ENTRYPOINT ["nginx", "-g", "daemon off;"]