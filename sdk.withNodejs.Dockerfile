FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster-slim AS base
# Prevent 'Warning: apt-key output should not be parsed (stdout is not a terminal)'
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
# install NodeJS 12.x
# see https://github.com/nodesource/distributions/blob/master/README.md#deb
RUN apt-get update -yq && apt-get upgrade -yq && apt-get install -yq curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
# use taobao mirrors
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install -g gulp
# clear the apt cache
RUN rm -rf /var/lib/apt/lists/ 
# timezone clear
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
