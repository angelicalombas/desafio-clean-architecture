FROM golang:1.23-alpine AS builder

WORKDIR /app

# Copia os arquivos de dependências primeiro para otimizar cache
COPY go.mod go.sum ./
RUN go mod download

# Copia o restante do código
COPY . .

# Compila o binário
RUN go build -o ordersystem ./cmd/ordersystem

# Stage final
FROM alpine:3.20

WORKDIR /app
COPY --from=builder /app/ordersystem .

# Usa variáveis de ambiente do .env
ENV DB_DRIVER=${DB_DRIVER}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_NAME=${DB_NAME}
ENV WEB_SERVER_PORT=${WEB_SERVER_PORT}
ENV GRPC_SERVER_PORT=${GRPC_SERVER_PORT}
ENV GRAPHQL_SERVER_PORT=${GRAPHQL_SERVER_PORT}

CMD ["./ordersystem"]
