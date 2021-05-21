FROM ubuntu:18.04

RUN apt update && apt -y upgrade
RUN apt install -y python
RUN apt install -y python-pip
RUN pip install requests

#Copy Binary
ADD test /test
ADD fuzzcoin.py /fuzzcoin.py

RUN chmod 755 /test
RUN chmod 755 /fuzzcoin.py

#start
WORKDIR /
CMD ["/fuzzcoin.py"]

