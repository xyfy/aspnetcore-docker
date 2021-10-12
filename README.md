# aspnetcore-docker  

## dotnet core 3.1

aspnetcore-docker

Runtimes: `yungongchang/dotnet3.1-base`

Sdk: `yungongchang/dotnet3.1-sdk`

Sdk_WITH_NODEJS_Gulp: `yungongchang/dotnet3.1-sdk-withnodejs`

## dotnet 5.0

Runtimes: `yungongchang/dotnet5.0-base`

Sdk: `yungongchang/dotnet5.0-sdk`

Sdk_WITH_NODEJS_Gulp: `yungongchang/dotnet5.0-sdk-withnodejs`

处理了dotnet5.0sdk的错误

updated at 2021-01-07

```bash
docker build -t yungongchang/yarnwithvue -f yarnwithvue.Dockerfile .
docker push yungongchang/yarnwithvue

docker build -t yungongchang/dotnet5.0-base -f 5.0.Dockerfile .
docker push yungongchang/dotnet5.0-base

docker build -t yungongchang/out-dotnet5.0-base -f out.5.0.Dockerfile .
docker push yungongchang/out-dotnet5.0-base

docker build -t yungongchang/out-dotnet5.0-sdk -f out.sdk.5.0.Dockerfile .
docker push yungongchang/out-dotnet5.0-sdk

docker build -t yungongchang/dotnet5.0-sdk -f sdk.5.0.Dockerfile .
docker push yungongchang/dotnet5.0-sdk

docker build -t yungongchang/dotnet5.0-sdk-withnodejs -f sdk.5.0.withNodejs.Dockerfile .
docker push yungongchang/dotnet5.0-sdk-withnodejs

docker build -t yungongchang/out-dotnet5.0-sdk-withnodejs -f out.sdk.5.0.withNodejs.Dockerfile .
docker push yungongchang/out-dotnet5.0-sdk-withnodejs
```