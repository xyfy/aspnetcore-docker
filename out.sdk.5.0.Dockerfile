FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS base
WORKDIR /app
# install libgdiplus for System.Drawing
RUN apk add libgdiplus --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add terminus-font
#debian底下
#RUN apt-get update -y && apt-get install -y curl libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
# timezone clear
RUN apk add tzdata
ENV TZ=Asia/Shanghai
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#根据文档https://wiki.alpinelinux.org/wiki/Setting_the_timezone是应该可以执行下面的命令的，实际发现删除的话，以上时区设置不能生效
#RUN apk del tzdata
RUN rm -rf /var/cache/apk/*