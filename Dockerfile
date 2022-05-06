FROM arshsisodiya/helioskirepo:public

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt update
RUN apt upgrade -y

RUN apt install sudo

RUN echo "Sudo :- it's ON"
RUN sudo apt install wget curl -y
RUN sudo apt-get install -y aria2

RUN sudo fallocate -l 5G /swapfile
RUN sudo chmod 600 /swapfile
RUN sudo mkswap /swapfile

RUN wget https://gist.githubusercontent.com/hsjsa/bfb36c733ba9980b7f46e86faef54f27/raw/fstab
RUN sudo cp fstab /etc/

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
