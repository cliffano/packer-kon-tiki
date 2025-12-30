version ?= 3.14.1-pre.0

ci: clean stage deps lint build-docker-kon-tiki build-docker-kon-tiki-private

clean:
	rm -rf stage/ logs/ /tmp/packer-tmp/

stage:
	mkdir -p stage/ stage/ansible/roles/ stage/ansible/collections/

init:
	mkdir -p artifacts
	packer plugins install github.com/hashicorp/docker
	packer plugins install github.com/hashicorp/puppet

rmdeps:
	rm -rf .venv/

define python_venv
	. .venv/bin/activate && $(1)
endef

deps:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)
	packer plugins install github.com/hashicorp/docker 1.1.2
	packer plugins install github.com/hashicorp/ansible 1.1.4

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

lint:
	$(call python_venv,ansible-lint -v .)
	$(call python_venv,yamllint .)
#   Disable shellcheck for now due to likely resource issue with the shellcheck run
# 	shellcheck provisioners/shell/*.sh

build-docker-kon-tiki:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-kon-tiki.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/packer/docker-kon-tiki.pkr.hcl

build-docker-kon-tiki-private:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-kon-tiki-private.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-kon-tiki.json \
		templates/packer/docker-kon-tiki-private.pkr.hcl

publish-docker-kon-tiki:
	docker push cliffano/kon-tiki:latest
	docker image push cliffano/kon-tiki:$(version)

publish-docker-kon-tiki-private:
	docker push ghcr.io/cliffano/kon-tiki:latest
	docker image push ghcr.io/cliffano/kon-tiki:$(version)

.PHONY: ci clean stage init rmdeps deps deps-upgrade lint build-docker-kon-tiki build-docker-kon-tiki-private publish-docker-kon-tiki publish-docker-kon-tiki-private
