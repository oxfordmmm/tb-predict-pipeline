FROM ubuntu:20.04

RUN apt update && apt install -y python3-pip git

#Install gnomon from git
RUN git clone https://github.com/GlobalPathogenAnalysisService/gnomon && cd gnomon && pip install .