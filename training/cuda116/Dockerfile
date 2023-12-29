FROM nvidia/cuda:11.6.1-devel-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python3-pip git-all python-is-python3 htop libsm6 libxext6 libxrender-dev gcc-10 g++-10
# https://github.com/NVlabs/instant-ngp/issues/119
# deepspeed needs this gcc to avoid error: parameter packs not expanded with ‘...’ when compiling cpu adam
ENV CC=/usr/bin/gcc-10
ENV CXX=/usr/bin/g++-10
ENV CUDA_ROOT=/usr/local/cuda
RUN ln -s /usr/bin/gcc-10 $CUDA_ROOT/bin/gcc
RUN ln -s /usr/bin/g++-10 $CUDA_ROOT/bin/g++

ADD cuda116/requirements.core.txt .
RUN pip install torch==1.13.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116
RUN pip install -r requirements.core.txt
ADD requirements.dev.txt .
RUN pip install -r requirements.dev.txt

ADD src /src
ADD export.sh .
WORKDIR /src
CMD [ "./finetune_llama2_7b_lora.sh" ]