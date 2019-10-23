FROM arm32v7/python:3.8-buster
WORKDIR /usr/lib
RUN apt-get update && apt-get install -y scons libssl-dev libffi-dev libcurl4-openssl-dev cmake
RUN pip -V
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.15.1/mongo-c-driver-1.15.1.tar.gz	&&\
tar xzvf mongo-c-driver-1.15.1.tar.gz										&&\
cd mongo-c-driver-1.15.1 && cmake . && make install && cd ..
RUN git clone https://github.com/mongodb/mongo.git mongo

CMD ["/bin/bash"]
