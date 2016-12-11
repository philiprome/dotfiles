.PHONY: install

current_dir:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

install: install-packages install-dotbot

install-dotbot:
	git submodule update --init --recursive
	${current_dir}/dotbot/bin/dotbot -d ${current_dir} -c install.conf.yaml

install-packages:
	sudo apt-get install -y \
		python \
		python-dev \
		vim vim-youcompleteme \
		htop \
		locate \
		curl \
		ncdu \
		silversearcher-ag \
		zip \
		unzip \
		fail2ban \
		ctags \
		cmake

install-docker:
	echo 'deb https://apt.dockerproject.org/repo debian-jessie main' | sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo apt-get install -y apt-transport-https
	sudo apt-get update
	sudo apt-get install -y ca-certificates gnupg2 docker-engine

enable-zsh:
	@ [[ ! $SHELL = "/bin/zsh" ]] && chsh -s /bin/zsh

enable-bash:
	@ [[ ! $SHELL = "/bin/bash" ]] && chsh -s /bin/bash
