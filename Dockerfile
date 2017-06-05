FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
RUN apt-get update
RUN apt-get install -y wget libgtk2.0-0 libpng12-0 git g++
RUN wget https://repo.continuum.io/archive/Anaconda2-4.4.0-Linux-x86_64.sh
RUN bash Anaconda2-4.4.0-Linux-x86_64.sh -b -p $HOME/anaconda
RUN git clone https://github.com/apple2373/chainer-caption.git
RUN $HOME/anaconda/bin/pip install chainer==1.19.0 cupy
RUN $HOME/anaconda/bin/conda install -c menpo opencv3=3.2.0
WORKDIR /chainer-caption
RUN bash download.sh
COPY serve.sh /chainer-caption/webapi/serve.sh
WORKDIR webapi
CMD ["bash", "serve.sh"]