FROM node:18-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=node /app/dist/angular-14-form-validation /usr/share/nginx/html
