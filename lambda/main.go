package main

import (
	"context"
	"fmt"
	"io"
	"log"

	"github.com/aws/aws-lambda-go/events"
	awsEvents "github.com/aws/aws-lambda-go/events"
	awsLambda "github.com/aws/aws-lambda-go/lambda"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
)

var (
	sess *session.Session
)

func main() {
	awsLambda.Start(handler)
}

func handler(ctx context.Context, s3Event awsEvents.S3Event) {

	fmt.Println("handler > s3Event:", s3Event)

	sess = session.Must(session.NewSession())

	fileObject, fName, bucketName := extractS3Object(&s3Event)
	defer fileObject.Close()

	fmt.Println("fName", fName)
	fmt.Println("fileObject", fileObject)
	fmt.Println("bucketName", bucketName)
}

func extractS3Object(s3Event *events.S3Event) (io.ReadCloser, string, string) {

	s3Session := s3.New(sess)
	s3Entity := s3Event.Records[0].S3

	fmt.Println("extractS3Object > Bucket:", s3Entity.Bucket.Name, "Object:", s3Entity.Object.Key)

	s3Object, err := s3Session.GetObject(&s3.GetObjectInput{
		Bucket: aws.String(s3Entity.Bucket.Name),
		Key:    aws.String(s3Entity.Object.Key),
	})

	if err != nil {
		log.Fatal("extractS3Object > err:", err.Error())
	}

	return s3Object.Body, s3Entity.Object.Key, s3Entity.Bucket.Name
}
