FROM nvidia/cuda:12.1.1-devel-ubuntu22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python3-pip git-all python-is-python3 htop libsm6 libxext6 libxrender-dev

ADD requirements.core.txt .
RUN pip install -r requirements.core.txt
RUN pip install flash-attn==2.4.2 --no-build-isolation
ADD requirements.dev.txt .
RUN pip install -r requirements.dev.txt

ADD src /src

WORKDIR /src
CMD [ "./finetune_llama2_7b_lora.sh" ]