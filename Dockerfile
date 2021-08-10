# Basic image with git & vim to start python developing
FROM python:3.8-slim-buster 

WORKDIR /usr/src/data

RUN apt-get update && apt-get install -y \
	git \
	vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash krumm

USER krumm

CMD /bin/bash
