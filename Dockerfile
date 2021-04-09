FROM public.ecr.aws/bitnami/golang:latest AS builder

WORKDIR /function
COPY . /function
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -mod=vendor .

FROM public.ecr.aws/lambda/go:latest

ARG FUNCTION_DIR="/var/task/"
RUN mkdir -p ${FUNCTION_DIR}
COPY --from=builder /function ${FUNCTION_DIR}
CMD ["./golang-local-lambda"]