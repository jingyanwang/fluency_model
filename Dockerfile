############Dockerfile###########
FROM openjdk:8u292-jre

RUN apt-get update
RUN apt-get install -y bzip2 
RUN apt-get install -y wget
RUN apt-get install -y gcc 
RUN apt-get install -y git 
RUN apt-get install -y curl
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip

RUN pip3 install gdown==3.12.2
RUN pip3 install requests==2.24.0
RUN pip3 install pandas==1.1.3
RUN pip3 install elasticsearch==7.11.0

RUN pip3 install neo4j==4.1.1

RUN pip3 install Werkzeug==0.16.1
RUN pip3 install flask==1.1.2
RUN pip3 install flask_restplus==0.13.0
RUN pip3 install pytz==2021.3

####
USER root

RUN mkdir /yan
RUN mkdir /home/yan

RUN chmod 777 /home/*
RUN chmod 777 /yan
RUN chmod 777 /home/yan

RUN useradd -u 8877 yan

####

RUN pip3 install xlrd==1.1.0
RUN pip3 install xlsxwriter==1.4.3
RUN pip3 install pyspark==3.1.1
RUN pip3 install Pillow==8.2.0
RUN pip3 install esdk-obs-python==3.20.11 --trusted-host pypi.org

RUN pip3 install Flask==1.1.1
RUN pip3 install flask_restplus==0.13.0
RUN pip3 install Werkzeug==0.15.5
RUN pip3 install itsdangerous==1.1.0
RUN pip3 install jinja2==2.10.1
RUN pip3 install MarkupSafe==1.1.1
RUN pip3 install Flask-RESTful==0.3.9

ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3

######

RUN apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-pil python-pyrex 

RUN apt-get install -y idle-python2.7 

RUN apt-get install -y python-dev 
RUN apt-get install -y libssl-dev

RUN apt-get install -y libpq-dev python-dev
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxslt1-dev 
RUN apt-get install -y libldap2-dev 
RUN apt-get install -y libsasl2-dev 
RUN apt-get install -y libffi-dev

RUN apt-get install -y libhunspell-dev

RUN python3 -m pip install monocleaner

RUN apt-get install -y cmake
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y hunspell-es

######
USER root

########

WORKDIR /yan/
RUN wget https://github.com/bitextor/monocleaner-data/releases/download/v1.0/es.tgz
RUN tar zxvf es.tgz

WORKDIR /yan/
RUN git clone https://github.com/bitextor/monocleaner.git
WORKDIR /yan/monocleaner/monocleaner


WORKDIR /yan/
RUN git clone https://github.com/kpu/kenlm

WORKDIR /yan/kenlm
RUN python3 -m pip install . --install-option="--max_order 7"

RUN mkdir -p build
WORKDIR /yan/kenlm/build
RUN cmake .. -DKENLM_MAX_ORDER=7 -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/lib/python3.7/dist-packages/kenlm
RUN make -j all install

##

RUN apt-get install -y hunspell-gl
RUN pip3 install Flask==2.2.2
###

RUN echo "dsgs1g1s"


WORKDIR /yan/
RUN git clone https://github.com/jingyanwang/fluency_model.git

WORKDIR /yan/fluency_model/

############Dockerfile############