FROM ubuntu:16.04

# Install dependencies
RUN apt-get update --yes && apt-get upgrade --yes
RUN apt-get install -y git libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ ffmpeg libgroove-dev zlib1g-dev libpng-dev

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

# Copy Files
WORKDIR /opt/
ADD . audiogram
WORKDIR /opt/audiogram/

# Install dependencies
RUN npm install

EXPOSE 8888
CMD [ "npm", "start" ]
