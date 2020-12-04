FROM mcr.microsoft.com/dotnet/core/aspnet:5.0-buster-slim AS base
WORKDIR /app
COPY sources.list /app/sources.list
RUN rm -f /etc/apt/sources.list && mv sources.list /etc/apt/ 
RUN apt-get update -y && apt-get install -y curl libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
# clear the apt cache
RUN rm -rf /var/lib/apt/lists/ 
# timezone clear
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
