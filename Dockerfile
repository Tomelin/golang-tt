FROM  golang:1.22-alpine AS build

WORKDIR /app

COPY ./src /app/src

ENV CGO_ENABLED=0

RUN cd /app/src ; go build -ldflags='-s -w' -o /app/message /app/src/cmd/main.go

RUN adduser   --disabled-password --no-create-home -u 1001 nonroot


FROM scratch

WORKDIR /src

COPY --from=build /etc/passwd /etc/passwd

USER nonroot
COPY --chmod=0755 --from=build /app/message /src/

ENV MESSAGE="Bem vindo ao treinamento de Docker da TargetTrust"
ENV user="Dohn"

CMD ["/src/message"]


