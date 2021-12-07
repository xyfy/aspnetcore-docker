FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-alpine AS base
WORKDIR /app
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# install libgdiplus for System.Drawing
RUN apk add libgdiplus --update-cache --repository https://mirrors.aliyun.com/alpine/edge/testing/ --allow-untrusted
RUN apk add terminus-font
#debian底下
#RUN apt-get update -y && apt-get install -y curl libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
# timezone clear
# start fixed the sqlclient connect err in alpine only
RUN apk add icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

RUN apk add tzdata
RUN ls /usr/share/zoneinfo
ENV TZ=Asia/Shanghai
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN rm -rf /var/cache/apk/*