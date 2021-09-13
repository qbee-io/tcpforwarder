#!/usr/bin/env bash

find . -name "*.go" | xargs sed -i 's:jpillora/chisel:qbee-io/tcpforwarder:g'
find . -name "*.go" | xargs sed -i 's:CHISEL:TCPFORWARDER:g'
find . -name "*.go" | xargs sed -i 's:Chisel:TCPForwarder:g'
sed -i 's:jpillora/chisel:qbee-io/tcpforwarder:g' go.mod
find . -name "*.go" | xargs sed -i 's:chisel:tcpforwarder:g'
sed -i 's:jpillora/chisel:qbee-io/tcpforwarder:g' README.md Dockerfile .gitignore 
sed -i 's:chisel:tcpforwarder:g' README.md Dockerfile .gitignore 
env GOOS=windows GOARCH=amd64 go build

