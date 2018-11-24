FROM node:10
RUN apt-get update
RUN apt-get install dos2unix
ADD package*.json /nm/
WORKDIR /nm
RUN npm install
ADD . /code
RUN cd /code
RUN dos2unix /code/scripts/*
CMD bash /code/run-prod.sh
