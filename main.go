package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type Event struct {
	Key string `json:"key"`
}

func handler(ctx context.Context, event Event) (Event, error) {
	fmt.Println(event)
	return event, nil
}

func main() {
	lambda.Start(handler)
}