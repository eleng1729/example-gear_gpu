FROM nvidia/cuda:11.6.0-base-ubuntu20.04
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
 && pip3 install flywheel-sdk \
 && pip3 install tensorflow-gpu \
 && rm -rf /var/lib/apt/lists/*

ENV FLYWHEEL=/flywheel/v0
RUN mkdir -p ${FLYWHEEL}
COPY main.py ${FLYWHEEL}/main.py

ENTRYPOINT ["bash wrapper.sh"]