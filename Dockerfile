FROM alpine:3.19
LABEL maintainer="sri@mymail.com"
ENV My_env_var="Docker123"
WORKDIR /app
COPY hello.sh .
RUN chmod 770 hello.sh
ENTRYPOINT ["./hello.sh"]