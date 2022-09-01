FROM python:3.8-slim-buster

RUN  apt-get update
RUN  apt-get install zip unzip
ADD FlaskServer.zip .
RUN unzip FlaskServer.zip
WORKDIR /python-docker
COPY  . FlaskServer/req.txt
COPY . FlaskServer/server.py 

RUN pip3 install -r FlaskServer/req.txt
EXPOSE 3001
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
