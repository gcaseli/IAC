# IAC
Infraestrutura como código


### Go Dep
cd lambda
go get -u github.com/golang/dep/cmd/dep
dep ensure


### Create lambda

```text
cd lambda && GOOS=linux go build -o main && zip lambda.zip main && cd -
```

### Build terraform dev

```text
cd terraform/dev
terraform init
terraform plan
terraform apply
```


### User terraform account dev

```
export AWS_ACCESS_KEY_ID=???
export AWS_SECRET_ACCESS_KEY=???
```

### Publish lambda function
cd lambda && aws lambda update-function-code --function-name extract_process --zip-file fileb://lambda.zip --publish