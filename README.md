# serverless docker deployment

This repository aims to provide a reference to docker based cicd deployment for predicatable testing and deployment pattern for usage with serverless.

## How to use

* With docker-compose (Preferred Approach)

``` 
docker-compose up --build
```

Navigate to http://localhost:4000/hello


* Local machine

``` 
npm install -g serverless
npm install -g serverles-offline
npm install

npm start
```

## CICD instruction
* Create a docker image: 

```docker build -t serverless-docker-deployment .```

* Run test with docker:  

```docker run --rm serverless-docker-deployment test```

* Deploy to dev: 

```docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_REGION=us-east-1 -e REGION=us-east-1 -e STAGE=dev serverless-docker-deployment run deploy```

* Deploy to staging: 

```docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_REGION=us-east-1 -e REGION=us-east-1 -e STAGE=staging serverless-docker-deployment run deploy```
