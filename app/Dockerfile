#Build Container
FROM golang:alpine AS build
ADD . /app
RUN cd /app && go build -o send 


#Deploy Container
FROM alpine 
ENV queue_name=production
ENV ENDPOINT=34.141.45.254
ENV USER=fsddf34dc4
ENV PASS=fgdg453gdfhg
ENV rmq_url="amqp://${USER}:${PASS}@${ENDPOINT}:5672/"
WORKDIR /send 
COPY --from=build /app /send 
EXPOSE 8080
ENTRYPOINT ./send

