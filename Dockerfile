# Basic image with git & vim to start python developing
FROM python:3.8-slim-buster 

WORKDIR /usr/src/data

RUN apt-get update && apt-get install -y \
	git \
	vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash krumm

# Cloning my setup to container and create links
RUN git clone https://github.com/Krummhaus/dotfiles.git /home/krumm/dotfiles

RUN rm -f /home/krumm/.bashrc 

RUN	ln -sT /home/krumm/dotfiles/.bashrc /home/krumm/.bashrc && \
    ln -sT /home/krumm/dotfiles/.vimrc  /home/krumm/.vimrc && \
	ln -sT /home/krumm/dotfiles/.bash_aliases /home/krumm/.bash_aliases 

USER krumm

CMD /bin/bash
