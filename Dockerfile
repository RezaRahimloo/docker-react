FROM node:21-alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <------ all the stuff we care about

FROM nginx
# for aws elastic beanstalk 
# EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
