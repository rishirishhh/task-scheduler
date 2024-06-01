#!/bin/bash

# Get the directory where the script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the full path to the api.proto file
PROTO_FILE="$SCRIPT_DIR/api.proto"

# Check if protoc is installed and in the PATH
if ! command -v protoc &> /dev/null; then
    echo "protoc could not be found. Please install it and ensure it's in your PATH."
    exit 1
fi

# Check if protoc-gen-go is installed and in the PATH
if ! command -v protoc-gen-go &> /dev/null; then
    echo "protoc-gen-go could not be found. Please install it and ensure it's in your PATH."
    exit 1
fi

# Check if protoc-gen-go-grpc is installed and in the PATH
if ! command -v protoc-gen-go-grpc &> /dev/null; then
    echo "protoc-gen-go-grpc could not be found. Please install it and ensure it's in your PATH."
    exit 1
fi

# Run the protoc command with the proto_path and output directories
protoc --proto_path="$SCRIPT_DIR" \
  --go_out="$SCRIPT_DIR" --go_opt=paths=source_relative \
  --go-grpc_out="$SCRIPT_DIR" --go-grpc_opt=paths=source_relative \
  "$(basename "$PROTO_FILE")"
