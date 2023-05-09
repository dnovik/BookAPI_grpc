.PHONY: all clean

PROTO_DIR := .\api
PROTO_FILES := $(PROTO_DIR)\book.proto

GO_OUT_DIR := .\pkg
GO_OUT_FILES := $(GO_OUT_DIR)\*

all: $(GO_OUT_FILES)

$(GO_OUT_FILES): $(PROTO_FILES)
	@echo "Generating Go code from proto files..."
	@protoc --proto_path=$(PROTO_DIR) --go_out=$(GO_OUT_DIR) --go-grpc_out=$(GO_OUT_DIR) $(PROTO_FILES)
	@echo "Done!"

clean:
	@echo "Cleaning up generated Go code..."
	@del /q $(GO_OUT_FILES)
	@echo "Done!"