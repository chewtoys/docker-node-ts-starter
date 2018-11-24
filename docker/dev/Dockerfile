FROM node:10
RUN apt-get update
RUN apt-get install dos2unix
ADD package*.json /nm/
WORKDIR /nm
RUN npm install
ADD . /code
RUN cd /code
#important when you share project between linux/windows users
RUN dos2unix /code/scripts/*

CMD bash /code/run-dev-watch-ts.sh
