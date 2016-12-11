.PHONY: install

current_dir:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

install:
	apt-get install -y python make
	git submodule update --init --recursive
	${current_dir}/dotbot/bin/dotbot -d ${current_dir} -c install.conf.yaml

