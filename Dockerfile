FROM alpine:3.19
LABEL maintainer="sri@mymail.com"
ENV My_env_var="Docker123"
WORKDIR /app
COPY hello.sh .
RUN chmod 770 hello.sh
ENTRYPOINT ["./hello.sh"]

#multistage dockerfile
FROM ubuntu:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm intall
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80