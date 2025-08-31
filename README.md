
# Desafio Clean Architecture

Projeto apresentado como desafio na disciplina de Clean Architecture na Pós Graduação Go Expert da Full Cycle.
### 🛠️ Pré-requisitos
- Docker

- Docker Compose

### 🚀 Como Executar

#### Clone o repositório:
```shell
  git clone github.com/angelicalombas/desafio-clean-architecture
  cd desafio-clean-architecture
```

#### Suba a infraestrutura do projeto:

```shell
  make docker-up
```

#### Execute o projeto:

```shell
  make run
```

#### A aplicação estará disponível em:
- REST API: http://localhost:8000

- GraphQL Playground: http://localhost:8080

- gRPC Server: localhost:50051

### 📋 Endpoints Disponíveis

#### REST API
- Execute o comando abaixo para criar uma nova order:
```http
  POST http://localhost:8000/order/order
```
```http
    {
        "id": "3",
        "price": 10,
        "tax": 1.5,
        "final_price": 11.5
    }
```
- Execute o comando abaixo para listar as orders:
```http
  GET http://localhost:8000/order
```

#### GraphQL
- Acesse http://localhost:8080.

- Execute o comando abaixo para criar uma nova order:
```graphql
mutation createOrder {
  createOrder(input: {id: "1", Price: 10.00, Tax: 1.50}) {
    id
    Price
    Tax
    FinalPrice
  }
}
```
- Execute o comando abaixo para listar as orders:
```graphql
query listOrders{
  listOrders {
    id
    Price
    Tax
    FinalPrice
  }
}
```

#### gRPC
- Acesse o evans:
```shell
    make evans
```

- Execute o comando abaixo para criar uma nova order (informe os dados):
```gRPC
    call CreateOrder
```
- Execute o comando abaixo para listar as orders:
```gRPC
    call ListOrders
```