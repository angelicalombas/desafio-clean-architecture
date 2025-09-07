PROTO_OUT ?= internal/infra/grpc

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

compile-proto-go:
	protoc --proto_path=internal/infra/grpc/protofiles \
		--go_out=$(PROTO_OUT) \
		--go-grpc_out=$(PROTO_OUT) \
		order.proto

clean-proto:
	rm -f $(PROTO_OUT)/*.pb.go $(PROTO_OUT)/*_grpc.pb.go

evans:
	evans --package pb --service OrderService -r repl "$@"