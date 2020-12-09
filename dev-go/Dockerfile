FROM jbndlr/centos:8.1.1911-1

RUN dnf install --assumeyes \
# Base dependencies
      golang \
      git \
      protobuf-compiler \
# Networking and diagnosis tools as rquired by VSCode
      redhat-lsb-core \
      iproute-tc \
      procps-ng

# Install protobuf/gRPC
RUN export GO111MODULE=on \
 && go get google.golang.org/protobuf/cmd/protoc-gen-go \
           google.golang.org/grpc/cmd/protoc-gen-go-grpc \
 && unset GO111MODULE

RUN export GOPATH=/root/go \
 && export PATH="$PATH:$GOPATH/bin"

RUN dnf update --assumeyes \
# Install gocode-gomod
  && go get -x -d github.com/stamblerre/gocode 2>&1 \
  && go build -o gocode-gomod github.com/stamblerre/gocode \
  && mv gocode-gomod $GOPATH/bin/
# Install other go-related tools
RUN go get -u -v \
    github.com/acroca/go-symbols \
    github.com/go-delve/delve/cmd/dlv \
    github.com/mdempsky/gocode \
    github.com/ramya-rao-a/go-outline \
    github.com/rogpeppe/godef \
    github.com/sqs/goreturns \
    github.com/stamblerre/gocode \
    github.com/uudashr/gopkgs/cmd/gopkgs \
    golang.org/x/lint/golint 2>&1 \
    golang.org/x/tools/cmd/goimports \
    golang.org/x/tools/cmd/gorename \
    golang.org/x/tools/cmd/guru \
    google.golang.org/grpc

# Clean up
RUN dnf clean all --assumeyes \
  && rm -rf /var/cache/yum

EXPOSE 8000
